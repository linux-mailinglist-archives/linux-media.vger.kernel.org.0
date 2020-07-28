Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CB223132D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 21:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgG1Tyd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 15:54:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:36526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726764AbgG1Tyd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 15:54:33 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F01C2075A;
        Tue, 28 Jul 2020 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595966072;
        bh=z3RTYldI4Zax6DhwFLMFZoHJWAMKsWPXMCNUdp5q3qw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Q4KnJnRGXDmcHGd7YqCD+uolQe9gLS2wVgGuOYGuNJZLhbZ4IRhyfAcLSJbRLLN75
         /xITTaWj85yxXn2pl0C1X99NsOgCk2aPtgZIPEd46AxA2Zfq7+4cYv9ZHvWh8dEqGT
         TMwL1CG/n0aTLTo0mg8l0Ok0NSLaiuZ33/+Qp89w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e08e9822-7c0c-29d7-67b2-245af66b623a@codeaurora.org>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org> <1595503612-2901-5-git-send-email-rnayak@codeaurora.org> <e68ff810-362a-5b99-206b-f676b204101d@linaro.org> <94581989-e069-55e5-6b70-919185eda33e@linaro.org> <e0c03ce2-136c-2c5c-6f36-bb0c69a82e2d@codeaurora.org> <5a8af2da-cc3f-005d-47e6-b36be1104d6a@codeaurora.org> <20200727153806.kgegadvghmkevch3@vireshk-mac-ubuntu> <159589753282.1360974.11628682178494669632@swboyd.mtv.corp.google.com> <e08e9822-7c0c-29d7-67b2-245af66b623a@codeaurora.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and power-domains for venus
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Taniya Das <tdas@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Date:   Tue, 28 Jul 2020 12:54:31 -0700
Message-ID: <159596607146.1360974.8446772748472044390@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Rajendra Nayak (2020-07-27 21:17:28)
>=20
> On 7/28/2020 6:22 AM, Stephen Boyd wrote:
> > Quoting Viresh Kumar (2020-07-27 08:38:06)
> >> On 27-07-20, 17:38, Rajendra Nayak wrote:
> >>> On 7/27/2020 11:23 AM, Rajendra Nayak wrote:
> >>>> On 7/24/2020 7:39 PM, Stanimir Varbanov wrote:
> >>>>>>> +
> >>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 opp-533000000 {
> >>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opp-hz =3D /bits/ 64 <5=
33000000>;
> >>
> >> Is this the highest OPP in table ?
> >>
> >>>>> Actually it comes from videocc, where ftbl_video_cc_venus_clk_src
> >>>>> defines 533000000 but the real calculated freq is 533000097.
> >>>>
> >>>> I still don't quite understand why the videocc driver returns this
> >>>> frequency despite this not being in the freq table.
> >>>
> >>> Ok, so I see the same issue on sc7180 also. clk_round_rate() does see=
m to
> >>> return whats in the freq table, but clk_set_rate() goes ahead and set=
s it
> >=20
> > I'm happy to see clk_round_rate() return the actual rate that would be
> > achieved and not just the rate that is in the frequency tables. Would
> > that fix the problem?=20
>=20
> It would, but only if I also update the OPP table to have 533000097
> instead of 533000000 (which I guess is needed anyway)
> If this is the actual frequency that's achievable, then perhaps even the =
clock
> freq table should have this? 533000097 and not 533000000?
> That way clk_round_rate() would return the actual rate that's achieved and
> we don't need any extra math. Isn't that the reason these freq tables exi=
st
> anyway.

Yes the freq tables are there in the clk driver so we don't have to do a
bunch of math. Fixing them to be accurate has been deemed "hard" from
what I recall because the tables are generated from some math function
that truncates the lower Hertz values.
