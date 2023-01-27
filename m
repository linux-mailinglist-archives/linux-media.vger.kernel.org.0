Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B9A67DC04
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 03:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbjA0CAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 21:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbjA0CAU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 21:00:20 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3E288463
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 17:55:28 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id k13so3649106plg.0
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 17:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NQj2kHJswRrE5/+DN6WGgO1Xm+d71Lpi1MEhPfLEHwA=;
        b=HIgHTOhIbn2BfKcvG441MHp7qQ0PQLtQOhoqdzn5FWyYsZfGQ4g9LhXkO6gvXPB1mJ
         fRcYH62psgsGzqyXajXs+Fse0Bq2KfzF6nc32GPVVAu7SRE0fF2TgUpHgeGN5C2nIzZN
         QduLmu3JpNPDzArehcXahZKlS5BD9UEGs9JErPoqM2xYBh+9GduiijGwtmIyZSMKnmgq
         XSlhRldtoKyXgWj0o4s0tl/xf4Zq49lUmkxpLMDEMPtLdrr6i66KVmUT73/BgaWfqSzv
         pfsoNTrgUr3JepteXAw8pyX9SDBDwgiF+N0cOUqq4SBckNDk2OR1Kp0UxJyMofqzDpwk
         hlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQj2kHJswRrE5/+DN6WGgO1Xm+d71Lpi1MEhPfLEHwA=;
        b=sqcD+iEv6ie04GS8H55jV2JFpB2V4St79m5Zmn5d9DUONksi+ZdBFSUeEp1R8Dz1bh
         WBoMsR3bYiFjxBm2Vb4jeO1tomUj1bsJimIZkYbjx4sBbvr8urhAEaf/fefZCTBB79eH
         +jnBr860y7OizPlG1vQRu5ihOwPNC7zk4Ev9j0VL6Csl6n0noDDpH3P9GYVD1vEkD5lR
         WMyFZFlYego5dEmQIbhMsKzxcJeOXEh5nivbfxlhbAm7M8HX6SXhgh3eWwfw0wUR3kX9
         VTWrju4eGHEZ0EUc5PeW0ei2Z6qXjQptu8Ix6jfaDcQ8uvK/au5IPqeW9LLWrCs5Ioc+
         17xw==
X-Gm-Message-State: AFqh2kpNwZzbX6qx5AYuXVjIRfdLC9aB3LbPqOpDQCPI1TnBEc4GW/78
        Z3bLiQCbmSSb/AV4kZlnGcXUJXRZe2ujSZLUous=
X-Google-Smtp-Source: AMrXdXvvPWy61MnFtJjO/bIqyZfKS0UXu7wjpcS4XPWb1jIb3dNBLeLNglxIVllY9VdF2E9IrqQrQE2P1F2JR4M8h/8=
X-Received: by 2002:a17:90a:5297:b0:22b:3526:98d4 with SMTP id
 w23-20020a17090a529700b0022b352698d4mr3969711pjh.42.1674784461919; Thu, 26
 Jan 2023 17:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 26 Jan 2023 19:54:10 -0600
Message-ID: <CAHCN7xL9ybGtr1CXOjqv2cc6u1p+1QuM5akp809iLm2S3w8gqA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] media: imx-mipi-csis: Move to subdev active state
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 26, 2023 at 3:34 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> This small series moves the imx-mipi-csis driver to use the subdev
> active state. Patches 1/5 to 3/5 are small preparatory cleanups, with
> the main change in 4/5. Patch 5/5 is further cleanup that could have
> been included in 4/5, but that should be easier to review as a separate
> patch.
>
> The series has been tested on the i.MX8MP with the ISI, and IMX296 and
> IMX327 camera sensors.

I didn't notice any overall change in the CSIS capture on the imx8mn.
I can test the Mini if you want.

For the series:
Tested-by: Adam Ford <aford173@gmail.com> #imx8mn-beacon

adam
>
> Laurent Pinchart (5):
>   media: imx-mipi-csis: Rename error labels with 'err_' prefix
>   media: imx-mipi-csis: Don't take lock in runtime PM handlers
>   media: imx-mipi-csis: Pass format explicitly to internal functions
>   media: imx-mipi-csis: Use V4L2 subdev active state
>   media: imx-mipi-csis: Implement .init_cfg() using .set_fmt()
>
>  drivers/media/platform/nxp/imx-mipi-csis.c | 249 +++++++++------------
>  1 file changed, 103 insertions(+), 146 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
>
