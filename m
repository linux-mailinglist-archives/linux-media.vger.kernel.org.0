Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F962E3EDF
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 00:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730350AbfJXWOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 18:14:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44565 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730134AbfJXWOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 18:14:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id z11so115179wro.11
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 15:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=5w15yk+kPwu/oh3RfhgDn2EiyyIH3xVgYKRqDskTAiA=;
        b=eIIO45E1Z8mTLHxRPHpYTPuupkcqPUV3aLlGodiUXZnEd0qSJcKX8fwBc00DP0k+XE
         kGe9/q2PlxbkfRJmMhyppWkAQR4JPlLtVAQa1A7MMoZjbYeNcfRefxhOf0fwl8KN9K56
         uyLEG5Y/F2CmXIPGDX5kVg4FZQT/Bxvo6YpHroFYv53p/sPyjI/xJDlzqzfqt8iQsK0Q
         fQS8rjjlgE1ypqleTmWTHC2zu4tIgOTm9TaPCYWDJW4polrC4fGG+CWvLE4ls+hpcSY2
         zcStwLqXJ7oFj5SK1LtkzvbPnaHmojp+y5YIxOlQnueXZdH9ITcnLiaG3IVdUc5wenaQ
         b6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=5w15yk+kPwu/oh3RfhgDn2EiyyIH3xVgYKRqDskTAiA=;
        b=T5glZ3Efaljio3lb1NkDiH8WRNr48ctUPSTSys5gKvxr+shfTrkBxrnXKsldG00N7b
         Pa14aNCbmx8JK0vG5b+s/vamODKAHi7dbM8LhOPC27BENiawn48S/MBsUBwtoL5lNO1N
         wQtj+njEtnECY8mN3NRO5tH+NkvGYpcIIO3dJIshuneN7mBHCaQRP/6EHFpl02FxV1df
         co/1wN2wLdE6VrNLRxwCL9goV35XVpvdLYexNnFHhz3lLEBgZDNF1x/SYbSHpTaB0+5/
         jc1dI2UEilw8d2vtsaHmdZJpAtQMnBWTEk0E5jNVHJLXUnANbxeDn9h90N8zYVcM7FMs
         61Ag==
X-Gm-Message-State: APjAAAWsDt2TM8W8HSFMpaYEbqV0vTkQHKxHYwhU1w8wlaezYYBubndC
        wE6NUSpnMgSfcvZZftdJkEY=
X-Google-Smtp-Source: APXvYqxQ59rkMcnx5UjZzwxSKjEHlTWsYTurKWwhKu27XaHcH6bwUfJfD+hgM/6uhPxQnkhaDld/eg==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr5808989wrr.207.1571955292808;
        Thu, 24 Oct 2019 15:14:52 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id o19sm104273wmh.27.2019.10.24.15.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 15:14:51 -0700 (PDT)
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 0/7] media: imx: Miscellaneous fixes for i.MX7
In-reply-to: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
Date:   Thu, 24 Oct 2019 23:14:49 +0100
Message-ID: <m3y2x9dc4m.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Many thanks for this patches.
On Thu 24 Oct 2019 at 01:41, Laurent Pinchart wrote:
> Hello,
>
> This patch series contains miscellaneous fixes I developed while trying
> to capture from a CSI-2 sensor on the i.MX7.
>
> Patches 1/7, 2/7 and 6/7 are small fixes or enhancements, please see
> individual commit messages. Patches 3/7, 4/7 and 5/7 add support for 10-
> and 12-bit greyscale formats (both on the i.MX7 CSI-2 receiver side and
> the CSI side). Patch 7/7 finally fixes a recent issue with video field
> handling.
>
> Laurent Pinchart (7):
>   media: imx: imx7_mipi_csis: Power off the source when stopping
>     streaming
>   media: imx: imx7_mipi_csis: Print the RESOL_CH0 register
>   media: imx: imx7_mipi_csis: Add greyscale formats support
>   media: imx: imx6-media-csi: Replace Y16 with Y10 and Y12
>   media: imx: imx7-media-csi: Add Y10 and Y12 formats support
>   media: imx: imx7-media-csi: Remove unneeded register read
>   media: imx: imx7-media-csi: Fix video field handling
>

For the all series, if the remarks from Steve and Fabio regarding
the fixes tags and changelog in 7/7 get fixed:

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
	Rui


>
>  drivers/staging/media/imx/imx-media-csi.c   |  3 ++-
>  drivers/staging/media/imx/imx-media-utils.c | 13 ++++++++-----
>  drivers/staging/media/imx/imx7-media-csi.c  | 14 +++++++++++++-
>  drivers/staging/media/imx/imx7-mipi-csis.c  | 15 ++++++++++++++-
>  4 files changed, 37 insertions(+), 8 deletions(-)

