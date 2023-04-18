Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2AD86E5C55
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 10:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjDRImG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 04:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbjDRImF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 04:42:05 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52A9B7
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 01:42:00 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 3ECE6240033
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 10:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1681807319; bh=hcTQht/AVRdfE+tDJL1RYKtMTGekLudYlztN0Vd4RkU=;
        h=Subject:From:To:Date:From;
        b=o0RvTU6TExkt3jfYRykdLA8fGctSW40l7l1WqC53IF/0R7nFrPL2DqjxsZWQ9KdcC
         WzX/iJbWKf8guWZypDmToeDSom1CgkfJQwWRuMr8JA+BvtPzQmmHzAQYefTc1tDmRW
         yk2XRhECt4dMSujGS3tjjE6ZcaPFJxzVPnYyd588/FAz9Tf7pTgLJaYcylU8dutLas
         ilR5ZyJXxafZkCFZLbguBdZKCk0AGM86u471sCqHbWCgeA7kujmGWRSP7mFQtZAMrv
         w4YkNJMbIpYrH8wMdKdVJw632+6htqaSt2/bqvar8WhMrJ5DCsjtv0QqSOAMXd4zQm
         Np4sqOJSvuZfQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Q0y8Q1tvmz9rxB;
        Tue, 18 Apr 2023 10:41:58 +0200 (CEST)
Message-ID: <e675d9343e76c38c3d35d5a430990f5f2eae7b0b.camel@posteo.de>
Subject: Re: [PATCH] staging: media: imx: initialize hs_settle to avoid
 warning
From:   Martin Kepplinger <martink@posteo.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Tue, 18 Apr 2023 08:41:59 +0000
In-Reply-To: <86de50ed-5bd9-6cdf-a430-895839568ffd@xs4all.nl>
References: <86de50ed-5bd9-6cdf-a430-895839568ffd@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi Hans,

thank you for the patch. please use get_maintainer.pl to find all email
addresses to send this to. Sending this to linux-media only is
incomplete.

other than that, the patch lgtm and if you resend, you can add

Reviewed-by: Martin Kepplinger <martink@posteo.de>

thank you again,

                            martin


Am Dienstag, dem 18.04.2023 um 09:46 +0200 schrieb Hans Verkuil:
> Initialize hs_settle to 0 to avoid this compiler warning:
> 
> imx8mq-mipi-csi2.c: In function
> 'imx8mq_mipi_csi_start_stream.part.0':
> imx8mq-mipi-csi2.c:91:55: warning: 'hs_settle' may be used
> uninitialized [-Wmaybe-uninitialized]
>    91 | #define GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3f) << 2)
>       |                                                       ^~
> imx8mq-mipi-csi2.c:357:13: note: 'hs_settle' was declared here
>   357 |         u32 hs_settle;
>       |             ^~~~~~~~~
> 
> It's a false positive, but it is too complicated for the compiler to
> detect that.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> index 32700cb8bc4d..ca2efcc21efe 100644
> --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> @@ -354,7 +354,7 @@ static int imx8mq_mipi_csi_start_stream(struct
> csi_state *state,
>                                         struct v4l2_subdev_state
> *sd_state)
>  {
>         int ret;
> -       u32 hs_settle;
> +       u32 hs_settle = 0;
> 
>         ret = imx8mq_mipi_csi_sw_reset(state);
>         if (ret)


