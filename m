Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C244B2D00
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 19:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352737AbiBKScq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 13:32:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352729AbiBKScp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 13:32:45 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F0FB0B
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 10:32:43 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a8so24687650ejc.8
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 10:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9xAIDus574te+VbjZxp7AqnLEsNautdb3qfKteY8Atk=;
        b=hfJvdBnL4DZMrSn5s+r0BqXbnEKePYO9ys9WaIm9t7TtL4cKhL5V5M4a0WQArtqUGo
         kAhZikf/aQK7Ihwi6mDkorNySMpAF9z/sBOZrJpSGxghAvqxCswC/HhlfBmUaNJyb/oU
         Tjw8eSZpq/kuVlcm5pp5B1nLJXdTidehOb8FXZ1hkn/Dlhs443lYZ+NpiHIBgS1da+ba
         U/5ICOQrvKA8Ivrc2+wlRa1ueJXYXX7MhRkD/Lyf9WguWxA1N09CvnOA6XQkj9unWVCA
         eaKgaiACUXlOp5zdFWQHD0/YY/yB8U4LCr8gdhv+PCQ7O9XETHDPCNJZKQ2qeExUDIDG
         E4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9xAIDus574te+VbjZxp7AqnLEsNautdb3qfKteY8Atk=;
        b=g8QlqPKCh/0NbgHbcfRarxpxzf3J/zv8coQSaEewHzpg1h2WToPhZrBVtgzH22XgLn
         z0Rjhn/GA7Rq3z5nOei3ZF1qRJ+CTdJyshHkUCwH5vViMHQa0LuHFxNuUq6NQuP7zo/S
         k9d98r0sf4oGHHa3gmWSjHkY/iVnI38QSr09fU0DlCvopqgSMfTaVke7KpIge3tdfaDx
         k1Si9WPMPFsnNtpKTh/BATCqsqwgg6wX7iglCP1ruY14CgwQDDL0jc5d+mIx3/wjn/UL
         CmiicPzpZyyaU76hcmldlrcLtPIrNJcldkSgBxzYeDOjSKsfs6CPIX0Z1rWXkF8lKn8u
         8poA==
X-Gm-Message-State: AOAM5309oehwf8cwbICubyYeAjwpZQ8o/vIQYUsIy+zx9eT5VgwLHFdk
        CSXPlJtljE4NDb3cVriDJjtk41OYzi5QRhy4MWhnmwnv4Q8=
X-Google-Smtp-Source: ABdhPJy0bBkhLGrz7kx4dmxaFc57bwGXig/+otnnfWPtLStC+HmVkdQn//jYlk+R+SZKLVIWVKDA6D4sHl2STZ9VNi8=
X-Received: by 2002:a17:907:c26:: with SMTP id ga38mr2459656ejc.626.1644604361803;
 Fri, 11 Feb 2022 10:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20220211180216.290133-1-jacopo@jmondi.org> <20220211180216.290133-2-jacopo@jmondi.org>
In-Reply-To: <20220211180216.290133-2-jacopo@jmondi.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 11 Feb 2022 15:32:31 -0300
Message-ID: <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: imx: De-stage imx7-mipi-csis
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        xavier.roumegue@oss.nxp.com, Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Feb 11, 2022 at 3:01 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> The imx7-mipi-csis driver is in a good state and can be staged.

I think you meant de-staged :-)

> Move the imx7-mipi-csis.c driver to the newly created
> drivers/media/platform/imx directory and plumb the related
> options in Kconfig and in Makefile.

What about the comments in drivers/staging/media/imx/TODO?
