Return-Path: <linux-media+bounces-20931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A87349BCCF0
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 13:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBCA91C228DA
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84651D90A7;
	Tue,  5 Nov 2024 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ht6zMYob"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD3A1D63CA
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730810442; cv=none; b=E40/FKsPL6E0TBI48DfFqnEMMh3rJnO9djBo+bhaoHNkOPYvNvbER8YJ0G7UnJb1mqzJSS3s3Y2/inMTwDfp0RkCIbdDjKQr6Z//PLIPijI9UJ18Hn7NnImG1mZXz2Ps+ZVH6fGLM7jv8WnsqhAsI0b7UysjnGthAyLry3gPPcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730810442; c=relaxed/simple;
	bh=k9SZnsBx0VZbu4GpXuNOjEWyij+XAXzw7QIQSNdlk48=;
	h=Content-Type:Mime-Version:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=KV9kRLBK6vdBChs2EzSUnKyg9cuLxUEmgrKFdhqt+/k2COkYSTSufDtIhVZLco2RlMEBZjpGByuSlGQqq5ZiRmkiRg6u63Sjrs2gmbUMyI3s04GlqnXglBWp9cF99RnT9zwoxJqnqJ8gMRwEALIe8k5+5B5N4I7Gg0fccYqsRkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ht6zMYob; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so6532982a12.3
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 04:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1730810437; x=1731415237; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k6xUPM8jG2xzC7+viJ8pfpav0IysDKwAK7XlSgbo8f4=;
        b=ht6zMYobOkXgy5NzhZ27KXhmJF/8PwA61sye7W7aBYBGzqV7wqxoAwGdh2gIR1OZqR
         Y5pAgeCEU5PO83d+ZJavezcdEmhhA0lVnawmHQ2HlDwNSf8YB/8mqhpmuo3H3pZJA+NF
         12pkbiWLEaKApo0LZgfyuCH6hBeWrKwCMlx/TMXzZHf0ycKiVHTRksRmPfZwfdtWErgV
         bhS3v+6vpw0K7s8K4UhKxQmXV/9OO5tOdvrkWjZCCG8GTQIK9qxN5CT5gOea7MuyWDcv
         2EDNPCtESlcYhlJ43OgTxBmRUJKHDbtBqBsKxC/vS4xwd/1bbZHuYKesqEtDXSJsuJVd
         8+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730810437; x=1731415237;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6xUPM8jG2xzC7+viJ8pfpav0IysDKwAK7XlSgbo8f4=;
        b=ZMcd9Z2ghFqNepAbT/K1YYmZV8olQMey2/jXPrtBlHmZnTOkZ+2541Z6PbqbOo0tv/
         r7JW0H1gwTlfStqFu82NVU24lrjHWp3JExPSmrykUp802gyZbkLMLazzekHlxI8/H6xT
         LYFzRf+bjPGNmt6L5KtttemVTH7cXILeMsYUqcU9Jze/tLz8l3ilVc5u4KtpUlaSo2Tf
         XlfFQDCUpn2lgtDLPFlBvkG1Yxu/XjRTU682gDmWoHZNBTNHJcv7BAL5Xi72hB4okHO2
         KZAb6TSarMrDdxybCGPah2FpgALmuMH8pZ0NdZw02kg3tZZfdZ3Q+RQ5Z6i78DhFwU8d
         3CTg==
X-Forwarded-Encrypted: i=1; AJvYcCU0qo6n2x7sWQIBWcWeXRFkZTU94qELWkoEC9t1bz6SDw460i3FKmc+wtf0+oCPNIHTePq0VX4iAaK0Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS0KD9xqbjM1pGWg4kJCik8buqWF+YbBVUzcsJaiHJVlJdWRWY
	S2AG7/+9nzmpti/VVCYinnHVOAVf6kF75nnLnhIctqibdiAlj455b3XDiBylXCU=
X-Google-Smtp-Source: AGHT+IHtitNsg+mUkSAvfEcTJAZ9DQDd0adxrQlOAEriNwr14m0gGIuB5OOT/vIsaXUuVfjtM24gTA==
X-Received: by 2002:a05:6402:5213:b0:5ca:d9f:9146 with SMTP id 4fb4d7f45d1cf-5cbbf8ca4aemr33145545a12.17.1730810437129;
        Tue, 05 Nov 2024 04:40:37 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6a9a435sm1278687a12.3.2024.11.05.04.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 04:40:36 -0800 (PST)
Content-Type: multipart/mixed;
 boundary=1acea834cbbc3182c3a1ad418a932cb04d7ce894f5209baded8572042127
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Tue, 05 Nov 2024 13:40:36 +0100
Message-Id: <D5E93DI7GAS8.23YY5O5CTU9IJ@fairphone.com>
Subject: Re: [PATCH v4 0/6] media: qcom: camss: Add sc7280 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikram Sharma" <quic_vikramsa@quicinc.com>, <rfoss@kernel.org>,
 <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <akapatra@quicinc.com>, <hariramp@quicinc.com>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <matti.lehtimaki@gmail.com>
Cc: <bryan.odonoghue@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <D5AY4ZK858IO.3BH1USXK7NTAD@fairphone.com>
 <1f173036-279d-4802-bf04-cfa2d8066e68@quicinc.com>
In-Reply-To: <1f173036-279d-4802-bf04-cfa2d8066e68@quicinc.com>

--1acea834cbbc3182c3a1ad418a932cb04d7ce894f5209baded8572042127
Content-Type: multipart/alternative;
 boundary=5de1fefd683b84c70672092625f594d523f4740bfa707198fdf7e5d30c05

--5de1fefd683b84c70672092625f594d523f4740bfa707198fdf7e5d30c05
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

Hi Vikram,

On Mon Nov 4, 2024 at 10:08 AM CET, Vikram Sharma wrote:
> Hi Luca,
>
> Thanks for your review and your efforts to validate tpg for this
> Please find my comments inline.
>
> Regards,
> Vikram
>
> On 11/1/2024 8:57 PM, Luca Weiss wrote:
> > On Wed Oct 30, 2024 at 11:53 AM CET, Vikram Sharma wrote:
> >> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSI=
PHY,
> >> CSID, VFE/RDI interfaces in SC7280.
> >>
> >> SC7280 provides
> >>
> >> - 3 x VFE, 3 RDI per VFE
> >> - 2 x VFE Lite, 4 RDI per VFE
> >> - 3 x CSID
> >> - 2 x CSID Lite
> >> - 5 x CSI PHY
> >>
> >> The changes are verified on SC7280 qcs6490-rb3gen2 board, with attache=
d vision mezzanine
> >> the base dts for qcs6490-rb3gen2 is:
> >> https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc=
.com/
> > Hi Vikram!
> >
> > Two things:
> >
> > You use the property "power-domains-names" in both bindings and dtsi bu=
t
> > this property is never parsed in the kernel. This should be
> > "power-domain-names"
> Thanks for this catch. I will update this in next version.
> >
> > Second, I still can't get the test pattern to work on my QCM6490-based
> > phone (Fairphone 5). Could you please try if the commands as per [0]
> > work on your board?
> I verified TPG with this change. but only mode 8 and 9 are working for TP=
G.
> Rest of the modes are getting stuck. To debug this I have verified the=20
> register dump for all the TPG registers in all the modes.
> as expected the register programming is similar for all the modes just=20
> mode field is getting updated.
> We are discussing this issue with TPG hardware team. Will keep you posted=
.
>
> Steps I used to validate TPG:
>
> echo "* Reset pipeline"
> media-ctl-d**/dev/media0**--reset
> yavta --list /dev/v4l-subdev5
>
> # /dev/v4l-subdev5 represent CSID0 can be different as well.
> yavta --no-query -w '0x009f0903*8*' /dev/v4l-subdev5
>
> media-ctl -d/dev/media0*-*V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>
> media-ctl-d/dev/media0**-V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>
> media-ctl-d/dev/media0**-l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video=
0

Thanks for checking, I can confirm I see the same behavior on my board,
test pattern 8 and 9 work as expected.

This seems to be some issue with the clocks since taking the clock
definitions from older sc7280 camss patches (never sent to the list)
test patterns 1-7 work properly.

Please see attached patch on top of yours with which it works. I haven't
dug into it more to find out which exact clock is causing this, but this
should be a good starting point for you & the hardware team.

Regards
Luca

>
> >
> > [0]https://lore.kernel.org/linux-arm-msm/c912f2da-519c-4bdc-a5cb-e19c3a=
a63ea8@linaro.org/
> >
> > Regards
> > Luca
> >
> >> Changes in V4:
> >> - V3 had 8 patches and V4 is reduced to 6.
> >> - Removed [Patch v3 2/8] as binding change is not required for dtso.
> >> - Removed [Patch v3 3/8] as the fix is already taken care in latest
> >>    kernel tip.
> >> - Updated alignment for dtsi and dt-bindings.
> >> - Adding qcs6490-rb3gen2-vision-mezzanine as overlay.
> >> - Link to v3:https://lore.kernel.org/linux-arm-msm/20241011140932.1744=
124-1-quic_vikramsa@quicinc.com/
> >>
> >> Changes in V3:
> >> - Added missed subject line for cover letter of V2.
> >> - Updated Alignment, indentation and properties order.
> >> - edit commit text for [PATCH 02/10] and [PATCH 03/10].
> >> - Refactor camss_link_entities.
> >> - Removed camcc enablement changes as it already done.
> >> - Link to v2:https://lore.kernel.org/linux-arm-msm/20240904-camss_on_s=
c7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com/
> >>
> >> Changes in V2:
> >> - Improved indentation/formatting.
> >> - Removed _src clocks and misleading code comments.
> >> - Added name fields for power domains and csid register offset in DTSI=
.
> >> - Dropped minItems field from YAML file.
> >> - Listed changes in alphabetical order.
> >> - Updated description and commit text to reflect changes
> >> - Changed the compatible string from imx412 to imx577.
> >> - Added board-specific enablement changes in the newly created vision
> >>    board DTSI file.
> >> - Fixed bug encountered during testing.
> >> - Moved logically independent changes to a new/seprate patch.
> >> - Removed cci0 as no sensor is on this port and MCLK2, which was a
> >>    copy-paste error from the RB5 board reference.
> >> - Added power rails, referencing the RB5 board.
> >> - Discarded Patch 5/6 completely (not required).
> >> - Removed unused enums.
> >> - Link to v1:https://lore.kernel.org/linux-arm-msm/20240629-camss_firs=
t_post_linux_next-v1-0-bc798edabc3a@quicinc.com/
> >>
> >> Suresh Vankadara (1):
> >>    media: qcom: camss: Add support for camss driver on SC7280
> >>
> >> Vikram Sharma (5):
> >>    media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
> >>    media: qcom: camss: Sort CAMSS version enums and compatible strings
> >>    media: qcom: camss: Restructure camss_link_entities
> >>    arm64: dts: qcom: sc7280: Add support for camss
> >>    arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
> >>      mezzanine
> >>
> >>   .../bindings/media/qcom,sc7280-camss.yaml     | 439 +++++++++++++++
> >>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
> >>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  73 +++
> >>   arch/arm64/boot/dts/qcom/sc7280.dtsi          | 208 ++++++++
> >>   .../media/platform/qcom/camss/camss-csid.c    |   1 -
> >>   .../qcom/camss/camss-csiphy-3ph-1-0.c         |  13 +-
> >>   .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
> >>   .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
> >>   drivers/media/platform/qcom/camss/camss-vfe.c |   8 +-
> >>   drivers/media/platform/qcom/camss/camss.c     | 500 ++++++++++++++++=
--
> >>   drivers/media/platform/qcom/camss/camss.h     |   1 +
> >>   11 files changed, 1190 insertions(+), 63 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sc72=
80-camss.yaml
> >>   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-m=
ezzanine.dtso


--5de1fefd683b84c70672092625f594d523f4740bfa707198fdf7e5d30c05--

--1acea834cbbc3182c3a1ad418a932cb04d7ce894f5209baded8572042127
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=sc7280-camss-tpg-clocks.diff
Content-Type: text/x-patch; charset=utf-8; name=sc7280-camss-tpg-clocks.diff

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaQppbmRleCAwMWYxODA4MGE3OTguLjY5OTU1
ZDVmMmU3MyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzI4MC5kdHNp
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaQpAQCAtNDQyMiwxMiAr
NDQyMiwxMiBAQCBjY2kxX2kyYzE6IGkyYy1idXNAMSB7CiAJCWNhbXNzOiBjYW1zc0BhY2FmMDAw
IHsKIAkJCWNvbXBhdGlibGUgPSAicWNvbSxzYzcyODAtY2Ftc3MiOwogCi0JCQljbG9ja3MgPSA8
JmNhbWNjIENBTV9DQ19DQU1OT0NfQVhJX0NMSz4sCi0JCQkJIDwmY2FtY2MgQ0FNX0NDX0lGRV8w
X0NTSURfQ0xLPiwKLQkJCQkgPCZjYW1jYyBDQU1fQ0NfSUZFXzFfQ1NJRF9DTEs+LAotCQkJCSA8
JmNhbWNjIENBTV9DQ19JRkVfMl9DU0lEX0NMSz4sCi0JCQkJIDwmY2FtY2MgQ0FNX0NDX0lGRV9M
SVRFXzBfQ1NJRF9DTEs+LAotCQkJCSA8JmNhbWNjIENBTV9DQ19JRkVfTElURV8xX0NTSURfQ0xL
PiwKKwkJCWNsb2NrcyA9IDwmZ2NjIEdDQ19DQU1FUkFfSEZfQVhJX0NMSz4sCisJCQkJIDwmZ2Nj
IEdDQ19DQU1FUkFfU0ZfQVhJX0NMSz4sCisJCQkJIDwmY2FtY2MgQ0FNX0NDX0NBTU5PQ19BWElf
Q0xLPiwKKwkJCQkgPCZjYW1jYyBDQU1fQ0NfQ0FNTk9DX0FYSV9DTEtfU1JDPiwKKwkJCQkgPCZj
YW1jYyBDQU1fQ0NfQ1BBU19BSEJfQ0xLPiwKKwkJCQkgPCZjYW1jYyBDQU1fQ0NfQ1BIWV9SWF9D
TEtfU1JDPiwKIAkJCQkgPCZjYW1jYyBDQU1fQ0NfQ1NJUEhZMF9DTEs+LAogCQkJCSA8JmNhbWNj
IENBTV9DQ19DU0kwUEhZVElNRVJfQ0xLPiwKIAkJCQkgPCZjYW1jYyBDQU1fQ0NfQ1NJUEhZMV9D
TEs+LApAQCAtNDQzOCwyOSArNDQzOCwzMiBAQCBjYW1zczogY2Ftc3NAYWNhZjAwMCB7CiAJCQkJ
IDwmY2FtY2MgQ0FNX0NDX0NTSTNQSFlUSU1FUl9DTEs+LAogCQkJCSA8JmNhbWNjIENBTV9DQ19D
U0lQSFk0X0NMSz4sCiAJCQkJIDwmY2FtY2MgQ0FNX0NDX0NTSTRQSFlUSU1FUl9DTEs+LAotCQkJ
CSA8JmdjYyBHQ0NfQ0FNRVJBX0FIQl9DTEs+LAotCQkJCSA8JmdjYyBHQ0NfQ0FNRVJBX0hGX0FY
SV9DTEs+LAotCQkJCSA8JmNhbWNjIENBTV9DQ19DUEFTX0FIQl9DTEs+LAorCQkJCSA8JmNhbWNj
IENBTV9DQ19JQ1BfQUhCX0NMSz4sCisJCQkJIDwmY2FtY2MgQ0FNX0NDX1NMT1dfQUhCX0NMS19T
UkM+LAogCQkJCSA8JmNhbWNjIENBTV9DQ19JRkVfMF9BWElfQ0xLPiwKIAkJCQkgPCZjYW1jYyBD
QU1fQ0NfSUZFXzBfQ0xLPiwKIAkJCQkgPCZjYW1jYyBDQU1fQ0NfSUZFXzBfQ1BIWV9SWF9DTEs+
LAorCQkJCSA8JmNhbWNjIENBTV9DQ19JRkVfMF9DU0lEX0NMSz4sCiAJCQkJIDwmY2FtY2MgQ0FN
X0NDX0lGRV8xX0FYSV9DTEs+LAogCQkJCSA8JmNhbWNjIENBTV9DQ19JRkVfMV9DTEs+LAogCQkJ
CSA8JmNhbWNjIENBTV9DQ19JRkVfMV9DUEhZX1JYX0NMSz4sCisJCQkJIDwmY2FtY2MgQ0FNX0ND
X0lGRV8xX0NTSURfQ0xLPiwKIAkJCQkgPCZjYW1jYyBDQU1fQ0NfSUZFXzJfQVhJX0NMSz4sCiAJ
CQkJIDwmY2FtY2MgQ0FNX0NDX0lGRV8yX0NMSz4sCiAJCQkJIDwmY2FtY2MgQ0FNX0NDX0lGRV8y
X0NQSFlfUlhfQ0xLPiwKKwkJCQkgPCZjYW1jYyBDQU1fQ0NfSUZFXzJfQ1NJRF9DTEs+LAogCQkJ
CSA8JmNhbWNjIENBTV9DQ19JRkVfTElURV8wX0NMSz4sCiAJCQkJIDwmY2FtY2MgQ0FNX0NDX0lG
RV9MSVRFXzBfQ1BIWV9SWF9DTEs+LAorCQkJCSA8JmNhbWNjIENBTV9DQ19JRkVfTElURV8wX0NT
SURfQ0xLPiwKIAkJCQkgPCZjYW1jYyBDQU1fQ0NfSUZFX0xJVEVfMV9DTEs+LAotCQkJCSA8JmNh
bWNjIENBTV9DQ19JRkVfTElURV8xX0NQSFlfUlhfQ0xLPjsKLQotCQkJY2xvY2stbmFtZXMgPSAi
Y2Ftbm9jX2F4aSIsCi0JCQkJICAgICAgImNzaTAiLAotCQkJCSAgICAgICJjc2kxIiwKLQkJCQkg
ICAgICAiY3NpMiIsCi0JCQkJICAgICAgImNzaTMiLAotCQkJCSAgICAgICJjc2k0IiwKKwkJCQkg
PCZjYW1jYyBDQU1fQ0NfSUZFX0xJVEVfMV9DUEhZX1JYX0NMSz4sCisJCQkJIDwmY2FtY2MgQ0FN
X0NDX0lGRV9MSVRFXzFfQ1NJRF9DTEs+OworCQkJY2xvY2stbmFtZXMgPSAiY2FtX2hmX2F4aSIs
CisJCQkJICAgICAgImNhbV9zZl9heGkiLAorCQkJCSAgICAgICJjYW1ub2NfYXhpIiwKKwkJCQkg
ICAgICAiY2Ftbm9jX2F4aV9zcmMiLAorCQkJCSAgICAgICJjcGFzX2FoYiIsCisJCQkJICAgICAg
ImNwaHlfcnhfc3JjIiwKIAkJCQkgICAgICAiY3NpcGh5MCIsCiAJCQkJICAgICAgImNzaXBoeTBf
dGltZXIiLAogCQkJCSAgICAgICJjc2lwaHkxIiwKQEAgLTQ0NzEsMjIgKzQ0NzQsMjYgQEAgY2Ft
c3M6IGNhbXNzQGFjYWYwMDAgewogCQkJCSAgICAgICJjc2lwaHkzX3RpbWVyIiwKIAkJCQkgICAg
ICAiY3NpcGh5NCIsCiAJCQkJICAgICAgImNzaXBoeTRfdGltZXIiLAotCQkJCSAgICAgICJnY2Nf
Y2FtZXJhX2FoYiIsCi0JCQkJICAgICAgImdjY19jYW1lcmFfYXhpIiwKLQkJCQkgICAgICAic29j
X2FoYiIsCisJCQkJICAgICAgImljcF9haGIiLAorCQkJCSAgICAgICJzbG93X2FoYl9zcmMiLAog
CQkJCSAgICAgICJ2ZmUwX2F4aSIsCiAJCQkJICAgICAgInZmZTAiLAogCQkJCSAgICAgICJ2ZmUw
X2NwaHlfcngiLAorCQkJCSAgICAgICJ2ZmUwX2NzaWQiLAogCQkJCSAgICAgICJ2ZmUxX2F4aSIs
CiAJCQkJICAgICAgInZmZTEiLAogCQkJCSAgICAgICJ2ZmUxX2NwaHlfcngiLAorCQkJCSAgICAg
ICJ2ZmUxX2NzaWQiLAogCQkJCSAgICAgICJ2ZmUyX2F4aSIsCiAJCQkJICAgICAgInZmZTIiLAog
CQkJCSAgICAgICJ2ZmUyX2NwaHlfcngiLAotCQkJCSAgICAgICJ2ZmUwX2xpdGUiLAotCQkJCSAg
ICAgICJ2ZmUwX2xpdGVfY3BoeV9yeCIsCi0JCQkJICAgICAgInZmZTFfbGl0ZSIsCi0JCQkJICAg
ICAgInZmZTFfbGl0ZV9jcGh5X3J4IjsKKwkJCQkgICAgICAidmZlMl9jc2lkIiwKKwkJCQkgICAg
ICAidmZlX2xpdGUwIiwKKwkJCQkgICAgICAidmZlX2xpdGUwX2NwaHlfcngiLAorCQkJCSAgICAg
ICJ2ZmVfbGl0ZTBfY3NpZCIsCisJCQkJICAgICAgInZmZV9saXRlMSIsCisJCQkJICAgICAgInZm
ZV9saXRlMV9jcGh5X3J4IiwKKwkJCQkgICAgICAidmZlX2xpdGUxX2NzaWQiOwogCiAJCQlpbnRl
cmNvbm5lY3RzID0gPCZnZW1fbm9jICBNQVNURVJfQVBQU1NfUFJPQyAwICZjbm9jMiBTTEFWRV9D
QU1FUkFfQ0ZHIDA+LAogCQkJCQk8Jm1tc3Nfbm9jIE1BU1RFUl9DQU1OT0NfSEYgIDAgJm1jX3Zp
cnQgU0xBVkVfRUJJMSAgICAgMD47CmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3Fjb20vY2Ftc3MvY2Ftc3MuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9j
YW1zcy5jCmluZGV4IDMxOTI4MWJjYzdhNS4uY2I4OTIxYzY1MTk2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MuYworKysgYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MuYwpAQCAtMTQ4NCwxMSArMTQ4NCw5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgY2Ftc3Nfc3ViZGV2X3Jlc291cmNlcyBjc2lwaHlfcmVzXzcyODBbXSA9
IHsKIAkvKiBDU0lQSFkwICovCiAJewogCQkucmVndWxhdG9ycyA9IHt9LAotCQkuY2xvY2sgPSB7
ICJjc2lwaHkwIiwgImNzaXBoeTBfdGltZXIifSwKLQkJLmNsb2NrX3JhdGUgPSB7Ci0JCQl7IDMw
MDAwMDAwMCB9LAotCQkJeyAzMDAwMDAwMDAgfQotCQl9LAorCQkuY2xvY2sgPSB7ICJjc2lwaHkw
IiwgImNzaXBoeTBfdGltZXIiIH0sCisJCS5jbG9ja19yYXRlID0geyB7IDMwMDAwMDAwMCwgNDAw
MDAwMDAwIH0sCisJCQkJeyAzMDAwMDAwMDAgfSB9LAogCQkucmVnID0geyAiY3NpcGh5MCIgfSwK
IAkJLmludGVycnVwdCA9IHsgImNzaXBoeTAiIH0sCiAJCS5jc2lwaHkgPSB7CkBAIC0xNDk5LDEx
ICsxNDk3LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjYW1zc19zdWJkZXZfcmVzb3VyY2VzIGNz
aXBoeV9yZXNfNzI4MFtdID0gewogCS8qIENTSVBIWTEgKi8KIAl7CiAJCS5yZWd1bGF0b3JzID0g
e30sCi0JCS5jbG9jayA9IHsgImNzaXBoeTEiLCAiY3NpcGh5MV90aW1lciJ9LAotCQkuY2xvY2tf
cmF0ZSA9IHsKLQkJCXsgMzAwMDAwMDAwIH0sCi0JCQl7IDMwMDAwMDAwMCB9Ci0JCX0sCisJCS5j
bG9jayA9IHsgImNzaXBoeTEiLCAiY3NpcGh5MV90aW1lciIgfSwKKwkJLmNsb2NrX3JhdGUgPSB7
IHsgMzAwMDAwMDAwLCA0MDAwMDAwMDAgfSwKKwkJCQl7IDMwMDAwMDAwMCB9IH0sCiAJCS5yZWcg
PSB7ICJjc2lwaHkxIiB9LAogCQkuaW50ZXJydXB0ID0geyAiY3NpcGh5MSIgfSwKIAkJLmNzaXBo
eSA9IHsKQEAgLTE1MTQsMTEgKzE1MTAsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNhbXNzX3N1
YmRldl9yZXNvdXJjZXMgY3NpcGh5X3Jlc183MjgwW10gPSB7CiAJLyogQ1NJUEhZMiAqLwogCXsK
IAkJLnJlZ3VsYXRvcnMgPSB7fSwKLQkJLmNsb2NrID0geyAiY3NpcGh5MiIsICJjc2lwaHkyX3Rp
bWVyIn0sCi0JCS5jbG9ja19yYXRlID0gewotCQkJeyAzMDAwMDAwMDAgfSwKLQkJCXsgMzAwMDAw
MDAwIH0KLQkJfSwKKwkJLmNsb2NrID0geyAiY3NpcGh5MiIsICJjc2lwaHkyX3RpbWVyIiB9LAor
CQkuY2xvY2tfcmF0ZSA9IHsgeyAzMDAwMDAwMDAsIDQwMDAwMDAwMCB9LAorCQkJCXsgMzAwMDAw
MDAwIH0gfSwKIAkJLnJlZyA9IHsgImNzaXBoeTIiIH0sCiAJCS5pbnRlcnJ1cHQgPSB7ICJjc2lw
aHkyIiB9LAogCQkuY3NpcGh5ID0gewpAQCAtMTUyOSwxMSArMTUyMyw5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgY2Ftc3Nfc3ViZGV2X3Jlc291cmNlcyBjc2lwaHlfcmVzXzcyODBbXSA9IHsKIAkv
KiBDU0lQSFkzICovCiAJewogCQkucmVndWxhdG9ycyA9IHt9LAotCQkuY2xvY2sgPSB7ICJjc2lw
aHkzIiwgImNzaXBoeTNfdGltZXIifSwKLQkJLmNsb2NrX3JhdGUgPSB7Ci0JCQl7IDMwMDAwMDAw
MCB9LAotCQkJeyAzMDAwMDAwMDAgfQotCQl9LAorCQkuY2xvY2sgPSB7ICJjc2lwaHkzIiwgImNz
aXBoeTNfdGltZXIiIH0sCisJCS5jbG9ja19yYXRlID0geyB7IDMwMDAwMDAwMCwgNDAwMDAwMDAw
IH0sCisJCQkJeyAzMDAwMDAwMDAgfSB9LAogCQkucmVnID0geyAiY3NpcGh5MyIgfSwKIAkJLmlu
dGVycnVwdCA9IHsgImNzaXBoeTMiIH0sCiAJCS5jc2lwaHkgPSB7CkBAIC0xNTQ0LDExICsxNTM2
LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjYW1zc19zdWJkZXZfcmVzb3VyY2VzIGNzaXBoeV9y
ZXNfNzI4MFtdID0gewogCS8qIENTSVBIWTQgKi8KIAl7CiAJCS5yZWd1bGF0b3JzID0ge30sCi0J
CS5jbG9jayA9IHsgImNzaXBoeTQiLCAiY3NpcGh5NF90aW1lciJ9LAotCQkuY2xvY2tfcmF0ZSA9
IHsKLQkJCXsgMzAwMDAwMDAwIH0sCi0JCQl7IDMwMDAwMDAwMCB9Ci0JCX0sCisJCS5jbG9jayA9
IHsgImNzaXBoeTQiLCAiY3NpcGh5NF90aW1lciIgfSwKKwkJLmNsb2NrX3JhdGUgPSB7IHsgMzAw
MDAwMDAwLCA0MDAwMDAwMDAgfSwKKwkJCQl7IDMwMDAwMDAwMCB9IH0sCiAJCS5yZWcgPSB7ICJj
c2lwaHk0IiB9LAogCQkuaW50ZXJydXB0ID0geyAiY3NpcGh5NCIgfSwKIAkJLmNzaXBoeSA9IHsK
QEAgLTE1NjMsMTMgKzE1NTMsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjYW1zc19zdWJkZXZf
cmVzb3VyY2VzIGNzaWRfcmVzXzcyODBbXSA9IHsKIAl7CiAJCS5yZWd1bGF0b3JzID0geyAidmRk
YS1waHkiLCAidmRkYS1wbGwiIH0sCiAKLQkJLmNsb2NrID0geyAiY3NpMCIsICJ2ZmUwX2NwaHlf
cngiLCAidmZlMCIsICJzb2NfYWhiIn0sCi0JCS5jbG9ja19yYXRlID0gewotCQkJeyAzMDAwMDAw
MDAsIDAsIDM4MDAwMDAwMCwgMH0sCi0JCQl7IDQwMDAwMDAwMCwgMCwgNTEwMDAwMDAwLCAwfSwK
LQkJCXsgNDAwMDAwMDAwLCAwLCA2MzcwMDAwMDAsIDB9LAotCQkJeyA0MDAwMDAwMDAsIDAsIDc2
MDAwMDAwMCwgMH0KLQkJfSwKKwkJLmNsb2NrID0geyAidmZlMF9jc2lkIiwgInZmZTBfY3BoeV9y
eCIsICJ2ZmUwIiB9LAorCQkuY2xvY2tfcmF0ZSA9IHsgeyAzMDAwMDAwMDAsIDQwMDAwMDAwMCB9
LAorCQkJCXsgMCB9LAorCQkJCXsgMzgwMDAwMDAwLCA1MTAwMDAwMDAsIDYzNzAwMDAwMCwgNzYw
MDAwMDAwIH0gfSwKIAogCQkucmVnID0geyAiY3NpZDAiIH0sCiAJCS5pbnRlcnJ1cHQgPSB7ICJj
c2lkMCIgfSwKQEAgLTE1ODQsMTMgKzE1NzEsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjYW1z
c19zdWJkZXZfcmVzb3VyY2VzIGNzaWRfcmVzXzcyODBbXSA9IHsKIAl7CiAJCS5yZWd1bGF0b3Jz
ID0geyAidmRkYS1waHkiLCAidmRkYS1wbGwiIH0sCiAKLQkJLmNsb2NrID0geyAiY3NpMSIsICJ2
ZmUxX2NwaHlfcngiLCAidmZlMSIsICJzb2NfYWhiIn0sCi0JCS5jbG9ja19yYXRlID0gewotCQkJ
eyAzMDAwMDAwMDAsIDAsIDM4MDAwMDAwMCwgMH0sCi0JCQl7IDQwMDAwMDAwMCwgMCwgNTEwMDAw
MDAwLCAwfSwKLQkJCXsgNDAwMDAwMDAwLCAwLCA2MzcwMDAwMDAsIDB9LAotCQkJeyA0MDAwMDAw
MDAsIDAsIDc2MDAwMDAwMCwgMH0KLQkJfSwKKwkJLmNsb2NrID0geyAidmZlMV9jc2lkIiwgInZm
ZTFfY3BoeV9yeCIsICJ2ZmUxIiB9LAorCQkuY2xvY2tfcmF0ZSA9IHsgeyAzMDAwMDAwMDAsIDQw
MDAwMDAwMCB9LAorCQkJCXsgMCB9LAorCQkJCXsgMzgwMDAwMDAwLCA1MTAwMDAwMDAsIDYzNzAw
MDAwMCwgNzYwMDAwMDAwIH0gfSwKIAogCQkucmVnID0geyAiY3NpZDEiIH0sCiAJCS5pbnRlcnJ1
cHQgPSB7ICJjc2lkMSIgfSwKQEAgLTE2MDUsMTMgKzE1ODksMTAgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBjYW1zc19zdWJkZXZfcmVzb3VyY2VzIGNzaWRfcmVzXzcyODBbXSA9IHsKIAl7CiAJCS5y
ZWd1bGF0b3JzID0geyAidmRkYS1waHkiLCAidmRkYS1wbGwiIH0sCiAKLQkJLmNsb2NrID0geyAi
Y3NpMiIsICJ2ZmUyX2NwaHlfcngiLCAidmZlMiIsICJzb2NfYWhiIn0sCi0JCS5jbG9ja19yYXRl
ID0gewotCQkJeyAzMDAwMDAwMDAsIDAsIDM4MDAwMDAwMCwgMH0sCi0JCQl7IDQwMDAwMDAwMCwg
MCwgNTEwMDAwMDAwLCAwfSwKLQkJCXsgNDAwMDAwMDAwLCAwLCA2MzcwMDAwMDAsIDB9LAotCQkJ
eyA0MDAwMDAwMDAsIDAsIDc2MDAwMDAwMCwgMH0KLQkJfSwKKwkJLmNsb2NrID0geyAidmZlMl9j
c2lkIiwgInZmZTJfY3BoeV9yeCIsICJ2ZmUyIiB9LAorCQkuY2xvY2tfcmF0ZSA9IHsgeyAzMDAw
MDAwMDAsIDQwMDAwMDAwMCB9LAorCQkJCXsgMCB9LAorCQkJCXsgMzgwMDAwMDAwLCA1MTAwMDAw
MDAsIDYzNzAwMDAwMCwgNzYwMDAwMDAwIH0gfSwKIAogCQkucmVnID0geyAiY3NpZDIiIH0sCiAJ
CS5pbnRlcnJ1cHQgPSB7ICJjc2lkMiIgfSwKQEAgLTE2MjYsMTMgKzE2MDcsMTAgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBjYW1zc19zdWJkZXZfcmVzb3VyY2VzIGNzaWRfcmVzXzcyODBbXSA9IHsK
IAl7CiAJCS5yZWd1bGF0b3JzID0geyAidmRkYS1waHkiLCAidmRkYS1wbGwiIH0sCiAKLQkJLmNs
b2NrID0geyAiY3NpMyIsICJ2ZmUwX2xpdGVfY3BoeV9yeCIsICJ2ZmUwX2xpdGUiLCAic29jX2Fo
YiJ9LAotCQkuY2xvY2tfcmF0ZSA9IHsKLQkJCXsgMzAwMDAwMDAwLCAwLCAzMjAwMDAwMDAsIDB9
LAotCQkJeyA0MDAwMDAwMDAsIDAsIDQwMDAwMDAwMCwgMH0sCi0JCQl7IDQwMDAwMDAwMCwgMCwg
NDgwMDAwMDAwLCAwfSwKLQkJCXsgNDAwMDAwMDAwLCAwLCA2MDAwMDAwMDAsIDB9Ci0JCX0sCisJ
CS5jbG9jayA9IHsgInZmZV9saXRlMF9jc2lkIiwgInZmZV9saXRlMF9jcGh5X3J4IiwgInZmZV9s
aXRlMCIgfSwKKwkJLmNsb2NrX3JhdGUgPSB7IHsgMzAwMDAwMDAwLCA0MDAwMDAwMDAgfSwKKwkJ
CQl7IDAgfSwKKwkJCQl7IDMyMDAwMDAwMCwgNDAwMDAwMDAwLCA0ODAwMDAwMDAsIDYwMDAwMDAw
MCB9IH0sCiAKIAkJLnJlZyA9IHsgImNzaWRfbGl0ZTAiIH0sCiAJCS5pbnRlcnJ1cHQgPSB7ICJj
c2lkX2xpdGUwIiB9LApAQCAtMTY0NywxMyArMTYyNSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGNhbXNzX3N1YmRldl9yZXNvdXJjZXMgY3NpZF9yZXNfNzI4MFtdID0gewogCXsKIAkJLnJlZ3Vs
YXRvcnMgPSB7ICJ2ZGRhLXBoeSIsICJ2ZGRhLXBsbCIgfSwKIAotCQkuY2xvY2sgPSB7ICJjc2kz
IiwgInZmZTBfbGl0ZV9jcGh5X3J4IiwgInZmZTBfbGl0ZSIsICJzb2NfYWhiIn0sCi0JCS5jbG9j
a19yYXRlID0gewotCQkJeyAzMDAwMDAwMDAsIDAsIDMyMDAwMDAwMCwgMH0sCi0JCQl7IDQwMDAw
MDAwMCwgMCwgNDAwMDAwMDAwLCAwfSwKLQkJCXsgNDAwMDAwMDAwLCAwLCA0ODAwMDAwMDAsIDB9
LAotCQkJeyA0MDAwMDAwMDAsIDAsIDYwMDAwMDAwMCwgMH0KLQkJfSwKKwkJLmNsb2NrID0geyAi
dmZlX2xpdGUxX2NzaWQiLCAidmZlX2xpdGUxX2NwaHlfcngiLCAidmZlX2xpdGUxIiB9LAorCQku
Y2xvY2tfcmF0ZSA9IHsgeyAzMDAwMDAwMDAsIDQwMDAwMDAwMCB9LAorCQkJCXsgMCB9LAorCQkJ
CXsgMzIwMDAwMDAwLCA0MDAwMDAwMDAsIDQ4MDAwMDAwMCwgNjAwMDAwMDAwIH0gfSwKIAogCQku
cmVnID0geyAiY3NpZF9saXRlMSIgfSwKIAkJLmludGVycnVwdCA9IHsgImNzaWRfbGl0ZTEiIH0s
CkBAIC0xNjcxLDE1ICsxNjQ2LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2Ftc3Nfc3ViZGV2
X3Jlc291cmNlcyB2ZmVfcmVzXzcyODBbXSA9IHsKIAl7CiAJCS5yZWd1bGF0b3JzID0ge30sCiAK
LQkJLmNsb2NrID0geyAidmZlMCIsICJ2ZmUwX2F4aSIsICJzb2NfYWhiIiwKLQkJCSAgICJjYW1u
b2NfYXhpIiwgImdjY19jYW1lcmFfYXhpIn0sCi0JCS5jbG9ja19yYXRlID0gewotCQkJeyAzODAw
MDAwMDAsIDAsIDgwMDAwMDAwLCAxNTAwMDAwMDAsIDB9LAotCQkJeyA1MTAwMDAwMDAsIDAsIDgw
MDAwMDAwLCAyNDAwMDAwMDAsIDB9LAotCQkJeyA2MzcwMDAwMDAsIDAsIDgwMDAwMDAwLCAzMjAw
MDAwMDAsIDB9LAotCQkJeyA3NjAwMDAwMDAsIDAsIDgwMDAwMDAwLCA0MDAwMDAwMDAsIDB9LAot
CQkJeyA3NjAwMDAwMDAsIDAsIDgwMDAwMDAwLCA0ODAwMDAwMDAsIDB9LAotCQl9LAorCQkuY2xv
Y2sgPSB7ICJjYW1ub2NfYXhpX3NyYyIsICJzbG93X2FoYl9zcmMiLCAiY3Bhc19haGIiLAorCQkJ
ICAgImNhbW5vY19heGkiLCAiaWNwX2FoYiIsICJ2ZmUwIiwgInZmZTBfYXhpIiwgImNhbV9oZl9h
eGkiIH0sCisJCS5jbG9ja19yYXRlID0geyB7IDE1MDAwMDAwMCwgMjQwMDAwMDAwLCAzMjAwMDAw
MDAsIDQwMDAwMDAwMCwgNDgwMDAwMDAwIH0sCisJCQkJeyA4MDAwMDAwMCB9LAorCQkJCXsgODAw
MDAwMDAgfSwKKwkJCQl7IDAgfSwKKwkJCQl7IDAgfSwKKwkJCQl7IDM4MDAwMDAwMCwgNTEwMDAw
MDAwLCA2MzcwMDAwMDAsIDc2MDAwMDAwMCB9LAorCQkJCXsgMCB9LAorCQkJCXsgMCB9IH0sCiAK
IAkJLnJlZyA9IHsgInZmZTAiIH0sCiAJCS5pbnRlcnJ1cHQgPSB7ICJ2ZmUwIiB9LApAQCAtMTY5
NywxNSArMTY3MywxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNhbXNzX3N1YmRldl9yZXNvdXJj
ZXMgdmZlX3Jlc183MjgwW10gPSB7CiAJewogCQkucmVndWxhdG9ycyA9IHt9LAogCi0JCS5jbG9j
ayA9IHsgInZmZTEiLCAidmZlMV9heGkiLCAic29jX2FoYiIsCi0JCQkgICAiY2Ftbm9jX2F4aSIs
ICJnY2NfY2FtZXJhX2F4aSJ9LAotCQkuY2xvY2tfcmF0ZSA9IHsKLQkJCXsgMzgwMDAwMDAwLCAw
LCA4MDAwMDAwMCwgMTUwMDAwMDAwLCAwfSwKLQkJCXsgNTEwMDAwMDAwLCAwLCA4MDAwMDAwMCwg
MjQwMDAwMDAwLCAwfSwKLQkJCXsgNjM3MDAwMDAwLCAwLCA4MDAwMDAwMCwgMzIwMDAwMDAwLCAw
fSwKLQkJCXsgNzYwMDAwMDAwLCAwLCA4MDAwMDAwMCwgNDAwMDAwMDAwLCAwfSwKLQkJCXsgNzYw
MDAwMDAwLCAwLCA4MDAwMDAwMCwgNDgwMDAwMDAwLCAwfSwKLQkJfSwKKwkJLmNsb2NrID0geyAi
Y2Ftbm9jX2F4aV9zcmMiLCAic2xvd19haGJfc3JjIiwgImNwYXNfYWhiIiwKKwkJCSAgICJjYW1u
b2NfYXhpIiwgImljcF9haGIiLCAidmZlMSIsICJ2ZmUxX2F4aSIsICJjYW1faGZfYXhpIiB9LAor
CQkuY2xvY2tfcmF0ZSA9IHsgeyAxNTAwMDAwMDAsIDI0MDAwMDAwMCwgMzIwMDAwMDAwLCA0MDAw
MDAwMDAsIDQ4MDAwMDAwMCB9LAorCQkJCXsgODAwMDAwMDAgfSwKKwkJCQl7IDgwMDAwMDAwIH0s
CisJCQkJeyAwIH0sCisJCQkJeyAwIH0sCisJCQkJeyAzODAwMDAwMDAsIDUxMDAwMDAwMCwgNjM3
MDAwMDAwLCA3NjAwMDAwMDAgfSwKKwkJCQl7IDAgfSwKKwkJCQl7IDAgfSB9LAogCiAJCS5yZWcg
PSB7ICJ2ZmUxIiB9LAogCQkuaW50ZXJydXB0ID0geyAidmZlMSIgfSwKQEAgLTE3MjMsMTUgKzE3
MDAsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjYW1zc19zdWJkZXZfcmVzb3VyY2VzIHZmZV9y
ZXNfNzI4MFtdID0gewogCXsKIAkJLnJlZ3VsYXRvcnMgPSB7fSwKIAotCQkuY2xvY2sgPSB7ICJ2
ZmUyIiwgInZmZTJfYXhpIiwgInNvY19haGIiLAotCQkJICAgImNhbW5vY19heGkiLCAiZ2NjX2Nh
bWVyYV9heGkifSwKLQkJLmNsb2NrX3JhdGUgPSB7Ci0JCQl7IDM4MDAwMDAwMCwgMCwgODAwMDAw
MDAsIDE1MDAwMDAwMCwgMH0sCi0JCQl7IDUxMDAwMDAwMCwgMCwgODAwMDAwMDAsIDI0MDAwMDAw
MCwgMH0sCi0JCQl7IDYzNzAwMDAwMCwgMCwgODAwMDAwMDAsIDMyMDAwMDAwMCwgMH0sCi0JCQl7
IDc2MDAwMDAwMCwgMCwgODAwMDAwMDAsIDQwMDAwMDAwMCwgMH0sCi0JCQl7IDc2MDAwMDAwMCwg
MCwgODAwMDAwMDAsIDQ4MDAwMDAwMCwgMH0sCi0JCX0sCisJCS5jbG9jayA9IHsgImNhbW5vY19h
eGlfc3JjIiwgInNsb3dfYWhiX3NyYyIsICJjcGFzX2FoYiIsCisJCQkgICAiY2Ftbm9jX2F4aSIs
ICJpY3BfYWhiIiwgInZmZTIiLCAidmZlMl9heGkiLCAiY2FtX2hmX2F4aSIgfSwKKwkJLmNsb2Nr
X3JhdGUgPSB7IHsgMTUwMDAwMDAwLCAyNDAwMDAwMDAsIDMyMDAwMDAwMCwgNDAwMDAwMDAwLCA0
ODAwMDAwMDAgfSwKKwkJCQl7IDgwMDAwMDAwIH0sCisJCQkJeyA4MDAwMDAwMCB9LAorCQkJCXsg
MCB9LAorCQkJCXsgMCB9LAorCQkJCXsgMzgwMDAwMDAwLCA1MTAwMDAwMDAsIDYzNzAwMDAwMCwg
NzYwMDAwMDAwIH0sCisJCQkJeyAwIH0sCisJCQkJeyAwIH0gfSwKIAogCQkucmVnID0geyAidmZl
MiIgfSwKIAkJLmludGVycnVwdCA9IHsgInZmZTIiIH0sCkBAIC0xNzQ3LDE0ICsxNzI1LDE1IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2Ftc3Nfc3ViZGV2X3Jlc291cmNlcyB2ZmVfcmVzXzcyODBb
XSA9IHsKIAl9LAogCS8qIFZGRTMgKGxpdGUpICovCiAJewotCQkuY2xvY2sgPSB7ICJ2ZmUwX2xp
dGUiLCAic29jX2FoYiIsCi0JCQkgICAiY2Ftbm9jX2F4aSIsICJnY2NfY2FtZXJhX2F4aSJ9LAot
CQkuY2xvY2tfcmF0ZSA9IHsKLQkJCXsgMzIwMDAwMDAwLCA4MDAwMDAwMCwgMTUwMDAwMDAwLCAw
fSwKLQkJCXsgNDAwMDAwMDAwLCA4MDAwMDAwMCwgMjQwMDAwMDAwLCAwfSwKLQkJCXsgNDgwMDAw
MDAwLCA4MDAwMDAwMCwgMzIwMDAwMDAwLCAwfSwKLQkJCXsgNjAwMDAwMDAwLCA4MDAwMDAwMCwg
NDAwMDAwMDAwLCAwfSwKLQkJfSwKKwkJLmNsb2NrID0geyAiY2Ftbm9jX2F4aV9zcmMiLCAic2xv
d19haGJfc3JjIiwgImNwYXNfYWhiIiwKKwkJCSAgICJjYW1ub2NfYXhpIiwgImljcF9haGIiLCAi
dmZlX2xpdGUwIiwgImNhbV9oZl9heGkiIH0sCisJCS5jbG9ja19yYXRlID0geyB7IDE1MDAwMDAw
MCwgMjQwMDAwMDAwLCAzMjAwMDAwMDAsIDQwMDAwMDAwMCwgNDgwMDAwMDAwIH0sCisJCQkJeyA4
MDAwMDAwMCB9LAorCQkJCXsgODAwMDAwMDAgfSwKKwkJCQl7IDAgfSwKKwkJCQl7IDAgfSwKKwkJ
CQl7IDMyMDAwMDAwMCwgNDAwMDAwMDAwLCA0ODAwMDAwMDAsIDYwMDAwMDAwMCB9LAorCQkJCXsg
MCB9IH0sCiAKIAkJLnJlZ3VsYXRvcnMgPSB7fSwKIAkJLnJlZyA9IHsgInZmZV9saXRlMCIgfSwK
QEAgLTE3NjksMTQgKzE3NDgsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjYW1zc19zdWJkZXZf
cmVzb3VyY2VzIHZmZV9yZXNfNzI4MFtdID0gewogCX0sCiAJLyogVkZFNCAobGl0ZSkgKi8KIAl7
Ci0JCS5jbG9jayA9IHsgInZmZTFfbGl0ZSIsICJzb2NfYWhiIiwKLQkJCSAgICJjYW1ub2NfYXhp
IiwgImdjY19jYW1lcmFfYXhpIn0sCi0JCS5jbG9ja19yYXRlID0gewotCQkJeyAzMjAwMDAwMDAs
IDgwMDAwMDAwLCAxNTAwMDAwMDAsIDB9LAotCQkJeyA0MDAwMDAwMDAsIDgwMDAwMDAwLCAyNDAw
MDAwMDAsIDB9LAotCQkJeyA0ODAwMDAwMDAsIDgwMDAwMDAwLCAzMjAwMDAwMDAsIDB9LAotCQkJ
eyA2MDAwMDAwMDAsIDgwMDAwMDAwLCA0MDAwMDAwMDAsIDB9LAotCQl9LAorCQkuY2xvY2sgPSB7
ICJjYW1ub2NfYXhpX3NyYyIsICJzbG93X2FoYl9zcmMiLCAiY3Bhc19haGIiLAorCQkJICAgImNh
bW5vY19heGkiLCAiaWNwX2FoYiIsICJ2ZmVfbGl0ZTEiLCAiY2FtX2hmX2F4aSIgfSwKKwkJLmNs
b2NrX3JhdGUgPSB7IHsgMTUwMDAwMDAwLCAyNDAwMDAwMDAsIDMyMDAwMDAwMCwgNDAwMDAwMDAw
LCA0ODAwMDAwMDAgfSwKKwkJCQl7IDgwMDAwMDAwIH0sCisJCQkJeyA4MDAwMDAwMCB9LAorCQkJ
CXsgMCB9LAorCQkJCXsgMCB9LAorCQkJCXsgMzIwMDAwMDAwLCA0MDAwMDAwMDAsIDQ4MDAwMDAw
MCwgNjAwMDAwMDAwIH0sCisJCQkJeyAwIH0gfSwKIAogCQkucmVndWxhdG9ycyA9IHt9LAogCQku
cmVnID0geyAidmZlX2xpdGUxIiB9LAo=
--1acea834cbbc3182c3a1ad418a932cb04d7ce894f5209baded8572042127--

