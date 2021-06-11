Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1913A4B50
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 01:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhFKXoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 19:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhFKXoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 19:44:18 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F1CC061574;
        Fri, 11 Jun 2021 16:42:08 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id e11so11666972ljn.13;
        Fri, 11 Jun 2021 16:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KTTMXD301kubhW2/lDFQivGY+zMl/SXEE2+hyaAZPMw=;
        b=AAlWfOT9kxVgBrPjr04TbtJLpzb6hSuO4UjxJCcdGPM869pk2XrMdOg5Rg+1bObIDF
         28dP027NfCPSh7gTLQCA86QKmm67940slX+tQlq12Tms7XNCBXnee6+5YFBvxuPB3Xkc
         zJvbNA3LQ9SgcYFOGOFfsn4oDWw1XxibeRfDBod3lMmO/1FVjaq3GhE2r8A0z2pYEvBH
         p4spnenJDDftXmzlG8pC16Z52+HCE5zMCzA7mqahACl8/6DA+Kms2ebop4oOGe/7opAc
         oDiE/6Q4f8PyGdMpIvpkW3WJC5ZuAxKbZgP22UG927A+DVuGSGN8GblM+ARiLvFnSl7S
         86rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KTTMXD301kubhW2/lDFQivGY+zMl/SXEE2+hyaAZPMw=;
        b=pQ17TM+FtE7sTWd/NCMG5JyPG+k8g+uqYrST8+msKfc2rrhReBZ7FgYlkJ44ypayeu
         WYlq3GUOrapJK6O4VUnndMQPvYn0hl23hF3WJ0FnXsEXRMKDeUwTNunkUC0kvfSakX4H
         ID+jUKVSUPRdQJgWSrbRHnWyeC2l2gOZNlclAqODTBHmh/4E3v75fIQyt4xea2SJQ3ZG
         ofRgdNf9pw0x3Si6FQLI39j7DMHx3mxPgvPSXzoLvJjux/xE77AXRc07Hoy0oSkGp3xh
         RSdjg95Un+FA7QfaQHUH7FJpUUKvCbfeGFP5gkE3tcc+fJeBvTeOx+gE5W6B/gB5rZNE
         5UGw==
X-Gm-Message-State: AOAM533xicJfFo+ckPLG97H4roZ0LnCXFETmWBDk0ltOW101NgYjhRXM
        PbRFeAOck0JOXwXH5wnpCdw=
X-Google-Smtp-Source: ABdhPJz03pnMer1043kcAhLObD/q1by1c27SVXXSVXFSWAKVMB7kyxN+SHnXZTTIW3Cb2Z1F2ew2aw==
X-Received: by 2002:a2e:878b:: with SMTP id n11mr4561617lji.225.1623454927182;
        Fri, 11 Jun 2021 16:42:07 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id b23sm972246ljk.18.2021.06.11.16.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 16:42:06 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 0/2] media: imx-jpeg: Constify a few static structs
Date:   Sat, 12 Jun 2021 01:41:59 +0200
Message-Id: <20210611234201.64832-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Constify two structs that are never modified.

The first patch constifies a static v4l2_m2m_ops struct which contains
function pointers.

The second constifies mxc_jpeg_fmt, which contains read-only data. In
order to do that, a number of function arguments, return values and
pointers was made const as well.

Rikard Falkeborn (2):
  media: imx-jpeg: Constify static struct v4l2_m2m_ops
  media: imx-jpeg: Constify static struct mxc_jpeg_fmt

 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 18 +++++++++---------
 drivers/media/platform/imx-jpeg/mxc-jpeg.h | 18 +++++++++---------
 2 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.32.0

