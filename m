Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D67066133E
	for <lists+linux-media@lfdr.de>; Sun,  8 Jan 2023 03:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbjAHCyA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Jan 2023 21:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjAHCx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Jan 2023 21:53:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79383631F;
        Sat,  7 Jan 2023 18:53:57 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD4D94AE;
        Sun,  8 Jan 2023 03:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673146435;
        bh=HXteQRPeTgPSqkLb+K4XtxNNxj1ycDYLGum2Ph3TzBY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N9+OkkCqKXJtexcDsjgrGSIUR7/D3q1xp8AIVI3a+vKr31JCDKrOQ4ECx1AZ+rswG
         R+C9H1k4s0O+GiFe+a36GMiTSbzThbXSgMdtkp9PY/V43a3zp4b1aurPiv2tx/lSyx
         d1SioVImnvd15iFP/ogAB8eyHvsUu+DGZQT/aieE=
Date:   Sun, 8 Jan 2023 04:53:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
Cc:     Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robert.foss@linaro.org, akapatra@quicinc.com, jzala@quicinc.com,
        todor.too@gmail.com, hverkuil@xs4all.nl, agross@kernel.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support
 for SM8250
Message-ID: <Y7owPhvoTAKnVIpv@pendragon.ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <a885c324-8ac5-da52-2b68-848f36fd045b@linaro.org>
 <a4b0ad23-c003-b2a5-acda-07164048673a@quicinc.com>
 <4c822211-ef91-416d-2363-cd0022a417af@nexus-software.ie>
 <d54cd6d9-a970-6038-1fc5-6d8b4709ce62@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d54cd6d9-a970-6038-1fc5-6d8b4709ce62@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Milen,

On Fri, Jan 06, 2023 at 11:49:23AM +0200, Milen Mitkov (Consultant) wrote:
> On 05/01/2023 20:43, Bryan O'Donoghue wrote:
> > On 05/01/2023 08:37, Milen Mitkov (Consultant) wrote:
> >> On 09/12/2022 18:17, Bryan O'Donoghue wrote:
> >>> On 09/12/2022 09:40, quic_mmitkov@quicinc.com wrote:
> >>>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> >>>>
> >>>> For v7:
> >>>> - Fix an issue with output state for different versions of the IFE
> >>>>    hardware (for platforms different from QRB5, e.g. QRB3).
> >>>>
> >>>
> >>> Yep.
> >>>
> >>> Working for me on rb3 now and thank you for updating the git commit 
> >>> in patch #4.
> >>>
> >>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>
> >>> for the series.
> >>>
> >>> ---
> >>> bod
> >>
> >> Hi Bryan, Robert, Hans and others,
> >>
> >> Happy New Year!
> >>
> >> Is there anything else I can/need to do to speed up the merging 
> >> process of this series?
> >>
> >> Thanks,
> >>
> >> Milen
> >
> > I don't think so.
> >
> > Is everything still working on linux-next ?
> >
> > e45fb347b630e...cc3c08b41a9c9 master        -> linux-next/master
>
> Hi Bryan,
> 
> Yes, I took the sm8250_config from 
> git.linaro.org/people/bryan.odonoghue/kernel.git, put it on most recent 
> master of git.linaro.org/kernel-org/linux-next.git and build with it, 
> virtual channels work as expected.

I haven't had much time to review the series so far, sorry about that.
Spare review time is limited, and I've recently focussed on the streams
API to get it merged in v6.3. I'll try to review your patches in that
context.

-- 
Regards,

Laurent Pinchart
