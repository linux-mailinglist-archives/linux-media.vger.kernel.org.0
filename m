Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 835289B998
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2019 02:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfHXA16 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 20:27:58 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42416 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbfHXA15 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 20:27:57 -0400
Received: by mail-pl1-f196.google.com with SMTP id y1so6463671plp.9
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2019 17:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=D3BPvu4wyVtLXZDOTSwU5GCAUe4fcIn73KGatmI2jaE=;
        b=vIkDlP+n9gEEPpDlHyCPkEXIEKynopHgF1kmcHwDA7wJZbay2MlP+n1A9BxaI1jukF
         BXGDj7eSoI5SMr5Z2JH6Es81HCnfKZlsB0EF3wXTnl9rvtaFrtYUZF4AhhbQm3Dbed6R
         5ZUFaQ/AxhD+Kaaj2oynkM5fXPCGt3KUGTjNZ3f+qvlxBy+8lrxdek11Wx5t1VzvxO6P
         Thk8Z1Bym83SCVQX7t9wWCTwvKdeLZI3neJSfyJ2FHFbCrYckXd8aZkMS9UyhpBe3Wsc
         S+/PvjBU5tTuyrbk8H+f5YVSofYYQz19sKmIBn23ceG+9G9lOoe/YiVKNrj+8hBdkWE8
         Kirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=D3BPvu4wyVtLXZDOTSwU5GCAUe4fcIn73KGatmI2jaE=;
        b=bkv9/I5TDODkDxU7gYw8PCnO+XAPmG5ltiXLSBC55SytgrOLQ1lrGNFur0Lr6O6aQf
         eXuWjjBeeFXpcqgGSe3Of+saze9XSyjwlXr//Ce24Ultm76+uwacHhkmJgtvtbe49cjW
         2b8etBK8Y1sot4hcPRx6trImFVeExu2fZjxoLkAi5VI8Awei0xu9Qp24sPCigHnwDbHG
         dPVTGORhwU+UCcC7vHylyzNEoIAsBRMpEtXkkjn2Crf+Mz+ucSVom5CeWzoL6XP1s7H9
         +cxxuGpHHFP8qxrpF62wZF9ExpXSFKit3+WuBzz+SGPcgO5HcU1tkZaW0HCNB+ociNJE
         pnVA==
X-Gm-Message-State: APjAAAWlaLR/U+Xn7ZGyh3KujbSDI2aXLIuRGPWBZVcD+Y1sqrcsFWM4
        A4q3A4cO+H1WU96BMRBq+K0oZFvX
X-Google-Smtp-Source: APXvYqzwSdOwewjQcsutHMWWzX4FhlRWGtWw/PCR+aE7Op5ulY011VvE6D+Hp7IIk02HNPlPAIdxuw==
X-Received: by 2002:a17:902:8696:: with SMTP id g22mr7728364plo.122.1566606476677;
        Fri, 23 Aug 2019 17:27:56 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id n70sm3703018pjc.3.2019.08.23.17.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 17:27:56 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 0/2] media: imx: Fix subdev unregister/register issues
Date:   Fri, 23 Aug 2019 17:27:48 -0700
Message-Id: <20190824002750.5860-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the media device module is removed and re-probed without also removing
and re-probing the subdevice modules, .unregister() and .register() ops
are called on the subdevices without the subdevice drivers being removed
and re-probed. This creates two problems:

- the CSI and PRPENCVF subdevices attempt to register a stale video capture
  device resulting in the kobject "tried to init an initialized object"
  backtrace.

- pad graph objects are added to the media device pad list twice, resulting
  in list corruption on the pad list.

The following two patches fix those issues.

Steve Longerbeam (2):
  media: imx: Move capture device init to registered
  media: imx: Move pads init to probe

 drivers/staging/media/imx/imx-ic-prp.c        | 25 ++++-----
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 51 ++++++++++---------
 drivers/staging/media/imx/imx-media-capture.c | 15 +++---
 drivers/staging/media/imx/imx-media-csi.c     | 35 +++++++------
 drivers/staging/media/imx/imx-media-vdic.c    | 27 ++++------
 drivers/staging/media/imx/imx6-mipi-csi2.c    | 27 +++++-----
 drivers/staging/media/imx/imx7-media-csi.c    | 38 +++++++-------
 drivers/staging/media/imx/imx7-mipi-csis.c    | 23 +++------
 8 files changed, 114 insertions(+), 127 deletions(-)

-- 
2.17.1

