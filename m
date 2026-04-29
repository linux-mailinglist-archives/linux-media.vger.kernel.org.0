Return-Path: <linux-media+bounces-59961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LJpCcHq8WmalQEAu9opvQ
	(envelope-from <linux-media+bounces-59961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 13:25:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AB4937C6
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 13:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D32773030D4C
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0144F3F20FE;
	Wed, 29 Apr 2026 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHJYPyLc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F63F0A9C
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461891; cv=pass; b=iV9+Yj7N5mGMZJB9f9TRuPbn235I/HKG7PTd39u+uYgv33pruTDH2WgrcO4rW/6xBaewvVAdNJwfTsBooGdXyLy2nPm/FsIMntiTVmKhfSNkU9qKIGjXhzE6LMJMHNKQFCmank0fFg5agSQ84fWm5e4T67eZrdQMkUI4jS2l/jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461891; c=relaxed/simple;
	bh=QbqXT4tTrrdjuTLkfmMqgyWw3/qNy/1JnUwKAJmmVXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pC1ABfQMfS0cx0P72sbbQW33/VOOa39ff8iMGOvyQwyCvg1XAgAq0A89f+pd2sOcZ+68swg1VJJQIYOSkoq6LFO2ndEcn6TzJ33udy4e97XDCUP7epI4OVyhncem5iivRTjadFhbLsXhydujlWWGWSfr+JWKi2oXi+8cHl67P2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHJYPyLc; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso7662277241.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 04:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777461889; cv=none;
        d=google.com; s=arc-20240605;
        b=ZRUQ6ptpXVIJ5DRtHkaZEIOYh2ceZOdPZDUq4EZSUeovCioLy4QKMig5z+bdfUQkWd
         Eu54wStttX9LBVbjwDAIQVP2hHdmpfXkX3knq8G+m/91QU+qKjQfd5j4Y6GqcdruT4Sn
         K/HzmMaV9C5TQvZrfNwojPWjOOuaNMvUd5sCRFQlh/g441gUgPnNYY5WWGfV3sfArHUR
         jVqQI49t9Z/qEJrA6kbSOppJ75MG0pVZi3QvCCBhQuGXHl82r0dA4juyeu7QtscPmWpR
         6k2gm3Z4y5i+5t6GIAY6u9An2fCIvZ7VwK592/3TWrXMCozvTLlRYJaWB9eZc/HbnEY3
         E0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7gz2/nVmfgvH8AxcwgS0YP5YxZm2HnbLT24tkQ8ZyMI=;
        fh=PTegCI85ZmRo96CeyRM+pmqBUKq1+/byYbDEnhj9WnU=;
        b=kXCcfXLHRybJsO4Pzbe//0QZenveb/v1o6Qkvbr8dY/IXZ5Gixd7vkmyyF9RFLWuR5
         p75whSMdFu6BN4dMCsX4AMEkR1lVpHLQQ7RWYHXyzzi52WVsJBQA5oZVmOrv2z0YD4Fv
         s/IHtjGUKjh5lDJnDzgl3BNz2uzllCC1r24CjMsKJDxkFyy22OAT6agWoIcuzeVtb4R/
         zWtcUmm9s6lgAoks5ZlXwNhjE2n4BIe7r/HWaFcmxW4M37q5R240ihu5rvOyTewDC8RJ
         EcNWOEiKAfX344IbQdcwsacNPsDnYPPTVnhzzOZdwXrwwUJUinOepGzummri0jNhRPzr
         yqGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777461889; x=1778066689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gz2/nVmfgvH8AxcwgS0YP5YxZm2HnbLT24tkQ8ZyMI=;
        b=DHJYPyLcfCack5RDNBh/WbrKv+wXFEVM1ogNbJePRh65yBH+9P8v4lakenfWlxAmUG
         gEqwnP4iem6/J2IU4ISlhomYEyM1i2P+F4X2ClbHh+mRSsCj5tigzw0i0OZx2MCW5fVi
         d/w21fuXq16Ul2O7iJHGpkYMM1892ghWW9xpcwsf+4Ko+E1uxg9zj0OP0F/ytJUty35E
         R2YtSCIep4y1iuIQbK+/mdMLVAcxU2TKIFPxihta1F9IJCzeTU509pBuMIMJStw6hDC3
         CDgH3q6Oim510t4nrUkPPrBDNdVjt7Hryf5wT9jd4saWoqRoBMCEr+mVGFwEt9d9lSj7
         XQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461889; x=1778066689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7gz2/nVmfgvH8AxcwgS0YP5YxZm2HnbLT24tkQ8ZyMI=;
        b=SQf8OsRNq7hJAMp12klVciFvpHhbewMPmixE2cTnWr660E5AXrPN39b5ZLloKuD2GN
         ejp362dX0x5l3+kUo4eOep2wmETTZupErIVWkl/Tzf7cxNcbhzO2pnTpdwDKAWyNKNGv
         gSMOp7qd8gyypeDzTNeX/DYfanHbEqvVex8cFRaon+3dl+62VlwZnaRLL8dt/saHQjaf
         lXp4MJhDXsaPnGxEcnqGlidPL09+IFIpqTsoMGjQTOpaGrlffNFM1JKFOoD+FhfPwbT+
         K6IGpsqbwZeDNRqrKn5il73cgizJ9N2O+X9KTxcpm0POY9KLjnsJlOvym/ozMU5sZjmV
         LLbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cQ5GVKOaRnSkMdpesP6CB+v+FJpfibUisGpiYWf2iDqtUagcUx2CPfMqux1VE1WRnZ+bvB7Ypl1MtAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydiQmbmiuO7d7w9TE3FuffB4KmMKdKNDfU49U9AtiNTHSzX52y
	9TmrjzPC9/GZQsmugRA3BjndweO0BBDFdO4uRGUoo0XRQFZHGQB2MsmGkpmM86DmTsuTvQURDkP
	V2Tl77NNaA2mvqKubbuhH/tc5/hVPnwQ=
X-Gm-Gg: AeBDieukibo1KBcuszL9Yub1iZ3qMa/NIMl69L+muMiWx7aQT38Cb+tttvBQZVXC9rs
	8dg6T7egpIf8abbw3GIlfZWRaWH9h6aUDJRMzifjHQTrX+NM9KGdMtBlk6h4R2YKzdx2q6UR6Rl
	w8I/x5zCS9sf+78/y78zcMxxtMwMvLYS7BqeRR8+km7crKLoBN1cL8KXM12RPF/WGn659rRp60v
	0k2eGXsT0gIqRjf64befIZiujklScc0pVyq9x16/LE7oEYtF3zrUua+7aFcykaAiGAfYtmRnrxU
	KMvNCq/J07NARf7ccP9pQi6ngLD23ufngrTTF2Y8X0qMlxVoag==
X-Received: by 2002:a05:6102:5e8c:b0:609:4d86:81b with SMTP id
 ada2fe7eead31-629278208bamr1936529137.27.1777461888827; Wed, 29 Apr 2026
 04:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com> <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
 <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com> <652bf474-a524-4391-b8d1-7c0bbdc28b4d@oss.qualcomm.com>
In-Reply-To: <652bf474-a524-4391-b8d1-7c0bbdc28b4d@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 29 Apr 2026 19:23:57 +0800
X-Gm-Features: AVHnY4L7oPV5ZetIKykRzVLPFjvo6DuPoYEk-dDEME-xpa-a28o8EUMduxtFbTA
Message-ID: <CAH2e8h4MNsaFiYmO_y8Pn8XVREGtGam5xY=yeFCK7p6BkD4y1g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B22AB4937C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59961-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qccamfrontsensor_extension8280.cab:url,qccamfrontsensor_extension8280.cat:url,mail.gmail.com:mid]

On Wed, Apr 29, 2026 at 6:08=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/29/26 8:36 AM, Pengyu Luo wrote:
> > On Mon, Apr 27, 2026 at 9:00=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/25/26 12:52 PM, Pengyu Luo wrote:
> >>> Hi846 is found on my Gaokun3, descripting it.
> >>>
> >>> Note that it seems that only Goakun3(3.0GHz) version is equipped with
> >>> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
> >>
> >> Are there any other noticeable hw differences between the two variants=
,
> >> that could warrant the DT to be split?
> >>
> >
> > Except for the cameras and cpu, I think no.(But I couldn't tell all
> > 3.0 variants are equipped with hi846) Before camera support, this DT
> > worked for both of them.
>
> Do the ACPI tables perhaps have some sort of a hwid mechanism? Perhaps
> two nodes defined for both cameras and the _STA method referencing some
> object?
>

No. It may poll sensormodule binarys, register lists are in
sensormodule, the slave addr may be here too.

In qccamfrontsensor_extension8280.cab

CAMF_RES_MTP_ALT.bin
CAMF_RES_MTP.bin
CAMF_RES_QRD.bin
com.qti.sensormodule.hlt_hi846.bin
com.qti.sensormodule.xinli_s5k4h7.bin
com.qti.tuned.default.bin # for hi846
com.qti.tuned.hlt_hi846.bin
com.qti.tuned.xinli_s5k4h7.bin
qccamfrontsensor_extension8280.cat
qccamfrontsensor_extension8280.inf
SCF1_FRONT_MTP.bin
SCFG_FRONT_MTP.bin
SCFG_FRONT_QRD.bin

in SCFG_FRONT_QRD.bin

Package ()
{
    "com.qti.sensormodule.hlt_hi846.bin",
    "com.qti.tuned.hlt_hi846.bin",
    0x0000000000150041,
    0x0000000046080F16, # id, id_addr, this can be found in the binary too
    0x0000000000000000,
},

If this fails, then try to load com.qti.sensormodule.xinli_s5k4h7.bin?

Best wishes,
Pengyu

> Konrad

