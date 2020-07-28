Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B2522FEA0
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 02:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgG1AwP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 20:52:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:54946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgG1AwO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 20:52:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05F0F20775;
        Tue, 28 Jul 2020 00:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595897534;
        bh=m7jjeXUjLOQLN5e/RcPuTUYcHmosve5+xAqi+Zbt0YQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=w62FTpylcJe1DoroN9vtlns6YHVZ+2MUmDYEb0s6XFUWPQafag64VmIWb6PNwqqQA
         q5XMN8JMuRn05nuXtJIuSRlc3kamGWpy6lHHX0HTMgdoOEROPNDM64PEncCXGAzkCF
         ywbGmjX0t8uW+seZw1Vv+ixRrR0Vl71EsGYPw1CA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200727153806.kgegadvghmkevch3@vireshk-mac-ubuntu>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org> <1595503612-2901-5-git-send-email-rnayak@codeaurora.org> <e68ff810-362a-5b99-206b-f676b204101d@linaro.org> <94581989-e069-55e5-6b70-919185eda33e@linaro.org> <e0c03ce2-136c-2c5c-6f36-bb0c69a82e2d@codeaurora.org> <5a8af2da-cc3f-005d-47e6-b36be1104d6a@codeaurora.org> <20200727153806.kgegadvghmkevch3@vireshk-mac-ubuntu>
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and power-domains for venus
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Taniya Das <tdas@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Date:   Mon, 27 Jul 2020 17:52:12 -0700
Message-ID: <159589753282.1360974.11628682178494669632@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Viresh Kumar (2020-07-27 08:38:06)
> On 27-07-20, 17:38, Rajendra Nayak wrote:
> > On 7/27/2020 11:23 AM, Rajendra Nayak wrote:
> > > On 7/24/2020 7:39 PM, Stanimir Varbanov wrote:
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opp-533000000 {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opp-hz =3D /bits/ 64=
 <533000000>;
>=20
> Is this the highest OPP in table ?
>=20
> > > > Actually it comes from videocc, where ftbl_video_cc_venus_clk_src
> > > > defines 533000000 but the real calculated freq is 533000097.
> > >=20
> > > I still don't quite understand why the videocc driver returns this
> > > frequency despite this not being in the freq table.
> >=20
> > Ok, so I see the same issue on sc7180 also. clk_round_rate() does seem =
to
> > return whats in the freq table, but clk_set_rate() goes ahead and sets =
it

I'm happy to see clk_round_rate() return the actual rate that would be
achieved and not just the rate that is in the frequency tables. Would
that fix the problem? It may be that we need to make clk_round_rate() do
some more math on qcom platforms and actually figure out what the rate
is going to be instead of blindly trust the frequency that has been set
in the tables.

> > to 533000097. Subsequently when we try to set a different OPP, it fails=
 to
> > find the 'current' OPP entry for 533000097. This sounds like an issue w=
ith the OPP
> > framework? Should we not fall back to the highest OPP as the current OP=
P?
> >=20
> > Stephen/Viresh, any thoughts?
>=20
> I think we (in all frameworks generally) try to set a frequency <=3D
> target frequency and so there may be a problem if the frequency is
> larger than highest supported. IOW, you need to fix tables a bit.
>=20

Rounding is annoying for sure.
