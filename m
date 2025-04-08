Return-Path: <linux-media+bounces-29662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E58DA814CF
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 20:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D303A1BA65DB
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0449C23F427;
	Tue,  8 Apr 2025 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="iEvqUm8g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1608723ED6D
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744137443; cv=none; b=TbQ04zV+tKz8xUnv93Q8yBgllCYZbjuK+Akh1hITrI8bw4sqanz0rI5tgbc+OJTw+vjVb6sVTQ15ssn18HAI59cmebmzq72TRKAXNBbkC88xTbrSPakWvze8Cr2T89pzJCmPPyZq0vZewJ1uMHfzotVY4III4jw1o7NxpGpHDsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744137443; c=relaxed/simple;
	bh=6xDY9DadgFWEYZ5eID50fhnZXfm/pJjas6LcXLIkbns=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FWktFt8YP0DBYtjlxTet53B5fpkUXLL6iROVU0Q97flQFugvN4whMqYsZLxgYZprzh4je2fJnttjLKraDawhBdN3EKNp0NMKRNj+iGnMyC2Mz6bP141uSXxcIL+/Iz5jPceZoKbBmVtjPzaM9ptv0h8hvrlQpU4FQHGhTZPHcDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=iEvqUm8g; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5b8d13f73so624665885a.0
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744137440; x=1744742240; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t7fTF2C6wopkhoF5DPFkvFg/0e9DygUkDcYB5QiIQwU=;
        b=iEvqUm8gmkcXMdiqIbE2ZwWg3KJFPkQ8ETixT+QUkpyalDy7zghG25h48j7sA5jwFz
         McXHNg5JBnldIXUsyS40vZa1RmjM4PwTxUB+QJPyPLG8zBYEqT6NErtnLZjYz9LS64DF
         3haTnav262G8cV/GQ9WldA2yM52DAghyauSbado3dtoDsPPcHu9p9SrHv/z6QSL19VDM
         AbIpBZQw3rcYQCVLVFQXvcDcHtQsFO8rv5aXYVcE4siHzNI5dReIXMGan/lmVNcLUYY/
         07woPOC5be0f46T3VvgkK0bB0FVko69MPaS9vJCh24X/lRy/3fOSCFyZwre2LM96lAjb
         OBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744137440; x=1744742240;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7fTF2C6wopkhoF5DPFkvFg/0e9DygUkDcYB5QiIQwU=;
        b=BdFOLKPx0uhawSC3vmQcdG52yR+foRhBJCVSiShHRimSJSZPkeWmkw0RfSfZJeEPuc
         fSK6OOJjazlTAtf4N8+3ntm84Bt8rx6NKIdx7tWlMz8Ir+OPzwGe67IdgRhACS78zASj
         Om6KKlYilOwoswpyEr1H3znALhIYpXPqNlCTMOBmO3EOJn1vfjf3GbDXKeqzuQU0s/bg
         JVsb30ZAgJAOcyCL0cObkQb3cNwAZizsAAJa+JkgXPS98/Ybg1TcjCD35Iw3TktgSO/0
         aPDxXeFBFwIOsRy6CuA4q+nH34gLDe6NQx3zrziprE+adxSW6MW7uJqISXY2UxB1tcxc
         SmAg==
X-Forwarded-Encrypted: i=1; AJvYcCXfBH3DfjuT2idwHneBEMT5h+Y04iQCQ8ig7+Cq7pZB50frr3MDrGb8y76leIJ9RNlMWjUzUFzYu5ZZDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbbl4UD9clb0gapG/tY/Rc3r8d6DzYFWe+9YpFCSnbgh/xPUrY
	ntJ8RwOake0q5+QoaWyxn8WC0bg3FUERVYjGLZTnr8BBF+TH1hLkH9V414xlZV0=
X-Gm-Gg: ASbGnctpckO2Zd1+SGA79c0sgYjA+EqdeqXy95IQiD/FKS8QDQRn6uz4DzEKwqeNZqS
	Gf6TfU9tlCe6S7H3gh3JAXYBamodY2EJH/ObedQ5YtCUIQp/X+LWkZZYTZ/WeDP1IpeLsF2Swgy
	FqLg7dA5nkmL0aRAKwciIDXLjuUrPPz0wsxi7yDxjvwBj2lePqds/0ZMl1Ht1wnbnlyofX4LSnw
	+2FLa07cQlaxZU0ffE7+LlrH5An6vudFZFRk8ctSuKJ6Vb0PQs0thH4RCmVMoD1/wrySABYI9nm
	51QqK63qzxY1WVkUgJiBVrhvwxBuz3/qXGlMZ1lgif49xq5odw==
X-Google-Smtp-Source: AGHT+IFJd7R8DPgHGvf26rV3rjvjU3RgWSOURwJKHWqzKISZuJLh5B5hOsPWLIHipPfB34yoS4637Q==
X-Received: by 2002:a05:620a:3949:b0:7c5:65ab:5002 with SMTP id af79cd13be357-7c79cc4913bmr27274985a.49.1744137439721;
        Tue, 08 Apr 2025 11:37:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75a617sm792413785a.31.2025.04.08.11.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:37:19 -0700 (PDT)
Message-ID: <b8d0deac8f6ae883f3a2374ecf56756c83a57ef1.camel@ndufresne.ca>
Subject: Re: [PATCH 00/20] Add support for HEVC and VP9 codecs in decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, Vikash Garodia	
 <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Stefan Schmidt
 <stefan.schmidt@linaro.org>, Hans Verkuil	 <hverkuil@xs4all.nl>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio	 <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov	
 <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org,  Dan Carpenter <dan.carpenter@linaro.org>
Date: Tue, 08 Apr 2025 14:37:17 -0400
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

This is for Bryan and Vikash to review first, but here's some initial feedb=
ack on that report.

Le mardi 08 avril 2025 =C3=A0 21:24 +0530, Dikshita Agarwal a =C3=A9crit=C2=
=A0:
> Hi All,
>=20
> This patch series adds initial support for the HEVC(H.265) and VP9
> codecs in iris decoder. The objective of this work is to extend the=20
> decoder's capabilities to handle HEVC and VP9 codec streams,
> including necessary format handling and buffer management.
> In addition, the series also includes a set of fixes to address issues
> identified during testing of these additional codecs.
>=20
> These patches also address the comments and feedback received from the=
=20
> RFC patches previously sent. I have made the necessary improvements=20
> based on the community's suggestions.
>=20
> Changes sinces RFC:
> - Added additional fixes to address issues identified during further=20
> testing.
> - Moved typo fix to a seperate patch [Neil]
> - Reordered the patches for better logical flow and clarity [Neil,=20
> Dmitry]
> - Added fixes tag wherever applicable [Neil, Dmitry]
> - Removed the default case in the switch statement for codecs [Bryan]
> - Replaced if-else statements with switch-case [Bryan]
> - Added comments for mbpf [Bryan]
> - RFC: https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_=
dikshita@quicinc.com/
>=20
> These patches are tested on SM8250 and SM8550 with v4l2-ctl and=20
> Gstreamer for HEVC and VP9 decoders, at the same time ensured that=20
> the existing H264 decoder functionality remains uneffected.
>=20
> Note: 1 of the fluster compliance test is fixed with firmware [1]
> [1]: https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c8=
8a5dc1e@quicinc.com/T/#u=C2=A0
>=20
> The result of fluster test on SM8550:
> =C2=A0131/147 testcases passed while testing JCT-VC-HEVC_V1 with=20
> =C2=A0GStreamer-H.265-V4L2-Gst1.0.
> =C2=A0The failing test case:
> =C2=A0- 10 testcases failed due to unsupported 10 bit format.
> =C2=A0=C2=A0 - DBLK_A_MAIN10_VIXS_4
> =C2=A0=C2=A0 - INITQP_B_Main10_Sony_1
> =C2=A0=C2=A0 - TSUNEQBD_A_MAIN10_Technicolor_2
> =C2=A0=C2=A0 - WP_A_MAIN10_Toshiba_3
> =C2=A0=C2=A0 - WP_MAIN10_B_Toshiba_3
> =C2=A0=C2=A0 - WPP_A_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_B_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_C_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_E_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_F_ericsson_MAIN10_2
> =C2=A0- 4 testcase failed due to unsupported resolution
> =C2=A0=C2=A0 - PICSIZE_A_Bossen_1
> =C2=A0=C2=A0 - PICSIZE_B_Bossen_1
> =C2=A0=C2=A0 - WPP_D_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_D_ericsson_MAIN_2=20
> =C2=A0- 1 testcase failed as bitstream is invalid (this fails with refere=
nce=20
> =C2=A0=C2=A0 as well)
> =C2=A0=C2=A0 - RAP_B_Bossen_2

I was surprised of this comment, so I ran it myself through the
official JCT reference decoder.

   [JCT-VC-HEVC_V1] (JCT-VT-H.265) RAP_B_Bossen_2                  ... Succ=
ess

I'm pretty sure this stream is valid. I personally care about these
reports since otherwise we cannot differentiate HW limitation, FW bugs
or V4L2 API limitation. The later is really something we want to know
about, since we can fix it. We cannot fix HW, and its up to the vendor
to fix their firmware.

This specific test is very nice test. It changes the coding
width/height but keeps the conf window the same (416x240).

Here's the coded size changes I could see:

Frame  0: 448 x 256
Frame 25: 416 x 240
Frame 70: 448 x 256

Each time, the driver must sent SRC_CHANGE, and if all went well, the
decoder should reallocate. Note that all this code in GStreamer is
recent, so it also a possibility, but something we can fix. I haven't
tried ffmpeg much, but same.

> =C2=A0- 1 testcase failed due to CRC mismatch
> =C2=A0=C2=A0 - RAP_A_docomo_6
> =C2=A0=C2=A0=C2=A0=C2=A0 Analysis - First few frames in this discarded by=
 firmware and are=20
> =C2=A0=C2=A0=C2=A0=C2=A0 sent to driver with 0 filled length. Driver send=
 such buffers to
> =C2=A0=C2=A0=C2=A0=C2=A0 client with timestamp 0 and payload set to 0 and=
=20
> =C2=A0=C2=A0=C2=A0=C2=A0 make buf state to VB2_BUF_STATE_ERROR. Such buff=
ers should be=20
> =C2=A0=C2=A0=C2=A0=C2=A0 dropped by GST. But instead, the first frame dis=
played as green=20
> =C2=A0=C2=A0=C2=A0=C2=A0 frame and when a valid buffer is sent to client =
later with same 0=20
> =C2=A0=C2=A0=C2=A0=C2=A0 timestamp, its dropped, leading to CRC mismatch =
for first frame.

This looks like a firmware bug, even if GStreamer had drop them all,
the CRC would still miss-match.

Important question is if this worked on Venus firmware ? If so, it
sounds like it should be addressed.

>=20
> =C2=A0235/305 testcases passed while testing VP9-TEST-VECTORS with=20
> =C2=A0GStreamer-VP9-V4L2-Gst1.0.
> =C2=A0The failing test case:
> =C2=A0- 64 testcases failed due to unsupported resolution
> =C2=A0=C2=A0 - vp90-2-02-size-08x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x66.webm
> =C2=A0- 2 testcases failed due to unsupported format
> =C2=A0=C2=A0 - vp91-2-04-yuv422.webm
> =C2=A0=C2=A0 - vp91-2-04-yuv444.webm
> =C2=A0- 1 testcase failed with CRC mismatch (fails with ref decoder as we=
ll)
> =C2=A0=C2=A0 - vp90-2-22-svc_1280x720_3.ivf

Not completely true:

	[VP9-TEST-VECTORS] (libvpx-VP9) vp90-2-22-svc_1280x720_3.ivf ... Success

But fails with the GStreamer libvpx integration. Would you mind filling
an issue please ? There is clearly a GStreamer bug (not a reference
one), please document it as-such in the next report.

> =C2=A0- 2 testcase failed due to unsupported resolution after sequence ch=
ange
> =C2=A0=C2=A0 - vp90-2-21-resize_inter_320x180_5_1-2.webm
> =C2=A0=C2=A0 - vp90-2-21-resize_inter_320x180_7_1-2.webm

Just be more precise, inter-frame resolution changes are not currently
supported in V4L2 stateful decoders. The concept and internals are
ready though. Basically, userpace would have to progressively re-
allocate the frames as they get dequeued, before being re-queued. That
is significant userspace modification, fine to not support it atm.

> =C2=A0- 1 testcase failed due to unsupported stream
> =C2=A0=C2=A0 - vp90-2-16-intra-only.webm
> =C2=A0Note: There is a timing issue with the clips having multiple resolu=
tion=20
> =C2=A0change. Where firmware returned all the buffers with previous seque=
nce=20
> =C2=A0and has no buffer left to attach the LAST flag to. At the same time=
,
> =C2=A0client is not queueing any further buffers, so there is deadlock wh=
ere=20
> =C2=A0client is waiting for LAST flag, while firmware doesn't have any=
=20
> =C2=A0capture buffer to attach LAST flag to.
> =C2=A0Ideally client should keep queueing the buffers on capture queue un=
till
> =C2=A0the LAST flag is received.

At least GStreamer do, so I slightly doubt your analyzes (happy to see
a bug report with relevant demonstration showing that !). I'll read it
as there is still bug with the resolution change draining process in
this driver.

>=20
> The result of fluster test on SM8250:
> =C2=A0132/147 testcases passed while testing JCT-VC-HEVC_V1 with
> =C2=A0GStreamer-H.265-V4L2-Gst1.0.
> =C2=A0The failing test case:
> =C2=A0- 10 testcases failed due to unsupported 10 bit format.
> =C2=A0=C2=A0 - DBLK_A_MAIN10_VIXS_4
> =C2=A0=C2=A0 - INITQP_B_Main10_Sony_1
> =C2=A0=C2=A0 - TSUNEQBD_A_MAIN10_Technicolor_2
> =C2=A0=C2=A0 - WP_A_MAIN10_Toshiba_3
> =C2=A0=C2=A0 - WP_MAIN10_B_Toshiba_3
> =C2=A0=C2=A0 - WPP_A_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_B_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_C_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_E_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_F_ericsson_MAIN10_2
> =C2=A0- 4 testcase failed due to unsupported resolution
> =C2=A0=C2=A0 - PICSIZE_A_Bossen_1
> =C2=A0=C2=A0 - PICSIZE_B_Bossen_1
> =C2=A0=C2=A0 - WPP_D_ericsson_MAIN10_2
> =C2=A0=C2=A0 - WPP_D_ericsson_MAIN_2
> =C2=A0- 1 testcase failed as bitstream is invalid (this fails with refere=
nce
> =C2=A0=C2=A0 as well)
> =C2=A0=C2=A0 - RAP_B_Bossen_2
>=20
> =C2=A0232/305 testcases passed while testing VP9-TEST-VECTORS with
> =C2=A0GStreamer-VP9-V4L2-Gst1.0.
> =C2=A0The failing test case:
> =C2=A0- 64 testcases failed due to unsupported resolution
> =C2=A0=C2=A0 - vp90-2-02-size-08x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-08x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-10x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-16x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-18x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-32x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-34x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-64x66.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x08.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x10.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x16.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x18.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x32.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x34.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x64.webm
> =C2=A0=C2=A0 - vp90-2-02-size-66x66.webm
> =C2=A0- 2 testcases failed due to unsupported format
> =C2=A0=C2=A0 - vp91-2-04-yuv422.webm
> =C2=A0=C2=A0 - vp91-2-04-yuv444.webm
> =C2=A0- 1 testcase failed with CRC mismatch (fails with ref decoder as we=
ll)
> =C2=A0=C2=A0 - vp90-2-22-svc_1280x720_3.ivf
> =C2=A0- 5 testcase failed due to unsupported resolution after sequence ch=
ange
> =C2=A0=C2=A0 - vp90-2-21-resize_inter_320x180_5_1-2.webm
> =C2=A0=C2=A0 - vp90-2-21-resize_inter_320x180_7_1-2.webm
> =C2=A0=C2=A0 - vp90-2-21-resize_inter_320x240_5_1-2.webm
> =C2=A0=C2=A0 - vp90-2-21-resize_inter_320x240_7_1-2.webm
> =C2=A0=C2=A0 - vp90-2-18-resize.ivf
> =C2=A0- 1 testcase failed with CRC mismatch
> =C2=A0=C2=A0 - vp90-2-16-intra-only.webm
> =C2=A0=C2=A0 Analysis: First few frames are marked by firmware as NO_SHOW=
 frame.
> =C2=A0=C2=A0 Driver make buf state to VB2_BUF_STATE_ERROR for such frames=
.
> =C2=A0=C2=A0 Such buffers should be dropped by GST. But instead, the firs=
t frame=20
> =C2=A0=C2=A0 is being displayed and when a valid buffer is sent to client=
 later
> =C2=A0=C2=A0 with same timestamp, its dropped, leading to CRC mismatch fo=
r first=20
> =C2=A0=C2=A0 frame.

I checked this one, 3 first frame are "decode only" indeed. Though, by
returning these buffer with STATE_ERROR, you loose the ability to show
these frame later. GStreamer should be fixed to do internal ref frame
management, not silently drop these though.

What you can do instead, is leave these frames queued, and only mark
them done once you hit a matching show_existing_frame. It will fix this
specific stream (and most usage of show existing frame in the wild),
but show-existing frame will remain broken. The other solution is to
keep the reference frame internal, and output copies, but that imply
some HW design, and also cost quite a lot in bandwidth.

This test hits the known V4L2 queue limitation that it can only output
a frame once, and can only input a frame once (you cannot encode twice
the same frame notably). I open to suggestion how to fix those, but I
don't have any solutions for now.

p.s. a third solution is make the firmware stateless :-D

> =C2=A0Note: Same timing issue as observed on SM8550 is seen on SM8250 as=
=20
> =C2=A0well.
>=20
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (20):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Skip destroying internal buff=
er if not dequeued
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Update CAPTURE format info ba=
sed on OUTPUT format
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add handling for corrupt and =
drop frames
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Avoid updating frame size to =
firmware during reconfig
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Send V4L2_BUF_FLAG_ERROR for =
buffers with 0 filled length
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add handling for no show fram=
es
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Improve last flag handling
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Skip flush on first sequence =
change
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Prevent HFI queue writes when=
 core is in deinit state
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Remove redundant buffer count=
 check in stream off
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Remove deprecated property se=
tting to firmware
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Fix missing function pointer =
initialization
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Fix NULL pointer dereference
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Fix typo in depth variable
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add a comment to explain usag=
e of MBPS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add HEVC and VP9 formats for =
decoder
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add platform capabilities for=
 HEVC and VP9 decoders
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Set mandatory properties for =
HEVC and VP9 decoders.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add internal buffer calculati=
on for HEVC and VP9 decoders
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add codec specific check for =
VP9 decoder drain handling
>=20
> =C2=A0drivers/media/platform/qcom/iris/iris_buffer.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 22 +-
> =C2=A0drivers/media/platform/qcom/iris/iris_ctrls.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 35 +-
> =C2=A0drivers/media/platform/qcom/iris/iris_hfi_common.h |=C2=A0=C2=A0 1 =
+
> =C2=A0.../platform/qcom/iris/iris_hfi_gen1_command.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 44 ++-
> =C2=A0.../platform/qcom/iris/iris_hfi_gen1_defines.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0.../platform/qcom/iris/iris_hfi_gen1_response.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 22 +-
> =C2=A0.../platform/qcom/iris/iris_hfi_gen2_command.c=C2=A0=C2=A0=C2=A0=C2=
=A0 | 143 +++++++-
> =C2=A0.../platform/qcom/iris/iris_hfi_gen2_defines.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 5 +
> =C2=A0.../platform/qcom/iris/iris_hfi_gen2_response.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 57 ++-
> =C2=A0drivers/media/platform/qcom/iris/iris_hfi_queue.c=C2=A0 |=C2=A0=C2=
=A0 2 +-
> =C2=A0drivers/media/platform/qcom/iris/iris_instance.h=C2=A0=C2=A0 |=C2=
=A0=C2=A0 6 +
> =C2=A0.../platform/qcom/iris/iris_platform_common.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 28 +-
> =C2=A0.../platform/qcom/iris/iris_platform_sm8250.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 15 +-
> =C2=A0.../platform/qcom/iris/iris_platform_sm8550.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 143 +++++++-
> =C2=A0drivers/media/platform/qcom/iris/iris_vb2.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/media/platform/qcom/iris/iris_vdec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 113 +++---
> =C2=A0drivers/media/platform/qcom/iris/iris_vdec.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/media/platform/qcom/iris/iris_vidc.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 -
> =C2=A0drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++=
++++++++++-
> =C2=A0drivers/media/platform/qcom/iris/iris_vpu_buffer.h |=C2=A0 46 ++-
> =C2=A020 files changed, 948 insertions(+), 153 deletions(-)
> ---
> base-commit: 7824b91d23e9f255f0e9d2acaa74265c9cac2e9c
> change-id: 20250402-iris-dec-hevc-vp9-2654a1fc4d0d
>=20
> Best regards,

