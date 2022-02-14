Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17414B4F30
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 12:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344375AbiBNLqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 06:46:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352666AbiBNLpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 06:45:08 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2CA9FD1
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 03:40:48 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id f17so26599040edd.2
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 03:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=txrRRj64BfB1XGOlz/p2vUCAsDRsRQyDzH1ftwqQ6nA=;
        b=ZIb9yZ0Y598ALLPAqm3u0e19ewvPYC9gpjN3o1C67Ey+fpOs/Od43NWY3z9T2AE43B
         igZXc32/RCpCu8hBGawRNDQ2bRNXgRIqck36AimfzvN1HTVEvdtAndUIrJzvni/bwKYp
         Yo4E5gijZhCQr/wEOh8EGe14H8Zxsb1pt28MiZr4lZh7GA1rkoCNGd15TnEQgS3M1JJg
         5dgQLv0usAdamVM29Z6T9T/nOC8N/726yJTh4iztWl037DCxMHukXgFR8OrNnT6NcjF2
         CD/8v79sujvrkHmkun/473gGfGeBiyVbjAUK5OiAbPI9Z1v2upUTLMfEai/VvsbMovi3
         Be3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=txrRRj64BfB1XGOlz/p2vUCAsDRsRQyDzH1ftwqQ6nA=;
        b=J3iFAFPGafOkEnKaBYQCMATZmMOPmhMRjR+i2hqiI/PjBXzb2M8jEg2NbhAZDaaZVe
         2ls0Pa56saizr2fgzU2o3xjosujF/ZEoY+xY6r2Oai7GJWA+CdkBxAOO81HkSYeXhepJ
         PTa8yBHg2ngCWglQ9vraQhyj1IGllL+wWi3RLwaJtf5HeqhMOMXbxlvC3LzEwRTj+7zK
         thGHq5LlvNKd3SbkRKWx4btaiFAkbbVutrH4nd2GTX8jYZMIyVBvBZUIn4QdkuJR6yFK
         Zf2qqi44codCYpMbUUPlybwjDumUi0c6zxEESrZJysT7WyeSSGKOnteMSbBu7CPK4+Pz
         HHKg==
X-Gm-Message-State: AOAM531gz5t8PsUyRmA9l80cRMAWdR3MIeU5cudznMTou93m7ZOqBp3e
        xHWY4YhQpp5FLsl4sVHeuc/IUy6H2Brhy2TbfjLWQcNn
X-Google-Smtp-Source: ABdhPJyhI2L7COBYWrFKiT5hgDepOL5o4PrnmVyl3g1I4gJg9l0Tha1gReG8ZTCcVGVZC5KKs3DTfOFxXp6+FFjn1Y8=
X-Received: by 2002:a05:6402:358e:: with SMTP id y14mr14956166edc.136.1644838846589;
 Mon, 14 Feb 2022 03:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20220211180216.290133-1-jacopo@jmondi.org> <20220211180216.290133-2-jacopo@jmondi.org>
 <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com> <20220214092358.mu5vvfkzn2zfvokm@uno.localdomain>
In-Reply-To: <20220214092358.mu5vvfkzn2zfvokm@uno.localdomain>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 14 Feb 2022 08:40:35 -0300
Message-ID: <CAOMZO5Dfah7htxY6x3_ORccRnqcHTJ0K4Mn=FLKFQW-rLJN0Ww@mail.gmail.com>
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

On Mon, Feb 14, 2022 at 6:22 AM Jacopo Mondi <jacopo@jmondi.org> wrote:

> I found nothing there that applies to this driver.
> Have I missed any point ?

You are right. After reading the comments in the TODO I see it does
not apply to this driver.

Sorry about the noise.
