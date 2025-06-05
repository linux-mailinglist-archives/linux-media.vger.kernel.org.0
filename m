Return-Path: <linux-media+bounces-34116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD7AACEF0D
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FD473AAF06
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B117520E718;
	Thu,  5 Jun 2025 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dk9Kw3MC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAFB17B50F
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749125938; cv=none; b=L0a3/7AcqfE5lM61YHPH7ejS6+oETNIATwoGMUcKAxjZC02vZx9d2KmeN8R6WV4/8so6zbhj6EdiFxHd4p+KvpLBOCj5CDoyp7KcKNc+ROKVfX67XM9vwJZPLFfFLbQb2kzkH2p3KmQw0ghDAixXLohgUayNbxu7g8ZNxiau28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749125938; c=relaxed/simple;
	bh=gDe4GyFDstnUIXvCGK8YDWu2kJ+dlXao3106mob+uGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZNhhcPIm22UTftxLPjmwLAzYapVd8ozpaXCP5lBd1iwpXFfnf7aE3EiPshdOwSVXc3QnIOyao2wPqVXd5vLsLlt67+ede8rA9ajVZIoSJT/hRnTboPpPAVxQPJ3OXVCoXjYWy7e+Y0K9MOY3wpU6WiHAjZpX2rlfgnUQtqhl40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dk9Kw3MC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEF0C4CEE7;
	Thu,  5 Jun 2025 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749125937;
	bh=gDe4GyFDstnUIXvCGK8YDWu2kJ+dlXao3106mob+uGQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dk9Kw3MCyeAdjwypK7aFuXLh1jeOMWS83A917VBQCK9Tb3M3RjB2OKrT3+OP/uV/A
	 WANvBuZ3+SzTTpuSiCk/zDNLrpElCfH6eN1qxQATk1XO8DzwD3llL+WGxIDE5nakx5
	 bbe87XP3QU2FcafKIB72oijvaBn6lPml1RysK6zfKtCcRZqSVJnP42v3cQgyQ23GmS
	 Tb5LJgo6GDd/XmYynG9AtYVKQ6xhN+ewIRezwHYu3eLHb3g+UN9R1l3Bv4d9/dPqqM
	 osnihhcGSC2OZeIVdKhmmJ8Xf6j9lqIi5FWpJxhNhgkZip/vp9cwfiUBN46Z1IavlX
	 NpL5BO3curSBA==
Date: Thu, 5 Jun 2025 14:18:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 6/9] libdvbv5/dvb-v5-std.c: add DTV_BANDWIDTH_HZ where
 possible
Message-ID: <20250605141853.1f2a6616@foz.lan>
In-Reply-To: <f3226f83c3e8cf9f71dc53d435abc381f88e08b0.1749121112.git.hverkuil@xs4all.nl>
References: <cover.1749121112.git.hverkuil@xs4all.nl>
	<f3226f83c3e8cf9f71dc53d435abc381f88e08b0.1749121112.git.hverkuil@xs4all.nl>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu,  5 Jun 2025 12:58:29 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Several systems support DTV_BANDWIDTH_HZ, add it.
> 
> This fixes a dvbv5-scan error message about missing support for
> DTV_BANDWIDTH_HZ.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
>  lib/libdvbv5/dvb-v5-std.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/libdvbv5/dvb-v5-std.c b/lib/libdvbv5/dvb-v5-std.c
> index c0a14175..74e2e4fe 100644
> --- a/lib/libdvbv5/dvb-v5-std.c
> +++ b/lib/libdvbv5/dvb-v5-std.c
> @@ -81,6 +81,7 @@ const unsigned int sys_isdbt_props[] = {
>  const unsigned int sys_atsc_props[] = {
>  	DTV_FREQUENCY,
>  	DTV_MODULATION,
> +	DTV_BANDWIDTH_HZ,
>  	0
>  };

Indeed, ISDB-T could have a bandwidth. In the beginning, only
Japan and Brazil were using it, with a 6MHz bandwidth. As far as
I remember, all drivers we currently have are for devices with
such limit. Yet, the spec allows other bandwidths as well. Not sure
if any Country is using a different bandwidth in practice, though.

> @@ -111,12 +112,14 @@ const unsigned int sys_dvbc_annex_ac_props[] = {
>  	DTV_INVERSION,
>  	DTV_SYMBOL_RATE,
>  	DTV_INNER_FEC,
> +	DTV_BANDWIDTH_HZ,
>  	0
>  };
>  
>  const unsigned int sys_dvbc_annex_b_props[] = {
>  	DTV_FREQUENCY,
>  	DTV_MODULATION,
> +	DTV_BANDWIDTH_HZ,
>  	0
>  };
>  
> @@ -126,6 +129,7 @@ const unsigned int sys_dvbs_props[] = {
>  	DTV_SYMBOL_RATE,
>  	DTV_INNER_FEC,
>  	DTV_POLARIZATION,
> +	DTV_BANDWIDTH_HZ,
>  	0
>  };
>  
> @@ -139,6 +143,7 @@ const unsigned int sys_dvbs2_props[] = {
>  	DTV_ROLLOFF,
>  	DTV_POLARIZATION,
>  	DTV_STREAM_ID,
> +	DTV_BANDWIDTH_HZ,
>  	0
>  };
>  
> @@ -149,12 +154,14 @@ const unsigned int sys_turbo_props[] = {
>  	DTV_INNER_FEC,
>  	DTV_MODULATION,
>  	DTV_POLARIZATION,
> +	DTV_BANDWIDTH_HZ,
>  	0
>  };
>  
>  const unsigned int sys_isdbs_props[] = {
>  	DTV_FREQUENCY,
>  	DTV_STREAM_ID,
> +	DTV_BANDWIDTH_HZ,
>  	0
>  };

The above are not right: Satellite and Cable don't use bandwidth.
Instead, the bandwidth is indirectly calculated from the symbol
rate and rolloff, using something like this:

	float rolloff = 1.35;	/* DVB-S rolloff */

	int bandwidth_hz = int(symbol_rate * rolloff);



For DVB-C Annex A and B, and for DVB-S (and, afaikt, for DVB-TURBO), the
rolloff is fixed. DVB-S2 is the only one that supports different
rolloff factors.

In any case, DVB core calculates it. See this code snippet:

        switch (c->delivery_system) {
        case SYS_ATSC:
        case SYS_DVBC_ANNEX_B:
                c->bandwidth_hz = 6000000;
                break;
        case SYS_DVBC_ANNEX_A:
                rolloff = 115;
                break;
        case SYS_DVBC_ANNEX_C:
                rolloff = 113;
                break;
        case SYS_DSS:
                rolloff = 120;
                break;
        case SYS_DVBS:
        case SYS_TURBO:
        case SYS_ISDBS:
                rolloff = 135;
                break;
        case SYS_DVBS2:
                switch (c->rolloff) {
                case ROLLOFF_20:
                        rolloff = 120;
                        break;
                case ROLLOFF_25:
                        rolloff = 125;
                        break;
                default:
                case ROLLOFF_35:
                        rolloff = 135;
                }
                break;
        default:
                break;
        }
        if (rolloff)
                c->bandwidth_hz = mult_frac(c->symbol_rate, rolloff, 100);

The Kernel calculates the bandwidth and may return it, but the opposite
is not true: any set operation for a TV standard that has DTV_SYMBOL_RATE
will simply discard/ignore what is there at DTV_BANDWIDTH_HZ.

Currently, the logic inside libdvbv5 assumes that all parameters are
read/write.

Thanks,
Mauro

