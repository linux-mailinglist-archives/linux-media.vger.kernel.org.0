Return-Path: <linux-media+bounces-4389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6695841CE1
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 08:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8180A282657
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 07:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DEC54BEF;
	Tue, 30 Jan 2024 07:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HiGPYP4d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631F53805
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706600826; cv=none; b=Lp5hVbn7pKY9+mCpBFAx3u4Z0fgKkoGJIA+DDRI5kW9davP7RthtCsTwFC5sl43WFNb5QCjIxhF+/r7NW1gS/UFttnURk0pqD13VLIxftzC4c/udkf7jdBf3dkKBS52Ow8WAV2QCJJq2e1W8tK6I6gtUP4M9d7Jc1hC2dbW9rxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706600826; c=relaxed/simple;
	bh=6wF3pjl+xGSbuQROF2HwbVRfOfePnmBeqT9YPU+Cd88=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=PXDJaJgcIDNav5i+l4Ed4PJ/dNVXNyRvczY9IOrTOHx6+BZQlxhVOO3ITFoG8R4aTILnCPgFvmPTTbPMgBU3DZ7/DqIc8cnlLPYxcNMSxHqPevJbO4aWuIltDjkrv5ALSKkvoQ/DyIzdAKf0WOkpyjtygwUAGo9Kxq1THbF4Zt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HiGPYP4d; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55f1102b300so1892943a12.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 23:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1706600821; x=1707205621; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlGtGfNm9kPhTsKQ1zfGwKYIV+yyIvsTE/Mjc0NVPIk=;
        b=HiGPYP4dYhUZByAnXCCfDyML/k5Tvd6nNZeKOF1+AtmmNXus/UUnslfILqa8rUm2gJ
         9HBwMHR8Zcrj3Jidevt7zIlYx4IqEC20W8ys7x1PWXZc8BiZLfqmP8RpF0px0ytZQWko
         I+FkP2gEYOyHXLrRqAV16brvLen0EWVDspuM1j+RdoedCPtTagGBCXKIc7ymagE410bC
         C13k39T3q33FXUvZrEwyzUmM98bmvllEzzg2HN/RccxvNRWz9G5aBadfgBa3hgcpMCco
         IIkUJc2qWddJXXBRnYcuFhDo0MdGaTj455hVkVa8mbINkt6Z1IMVGlfAB7bvJVNU6iCF
         N3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706600821; x=1707205621;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QlGtGfNm9kPhTsKQ1zfGwKYIV+yyIvsTE/Mjc0NVPIk=;
        b=XuhqJWQeu21Lym8wbmxjjR/AUwzvrluKkZYL4CaE/M/3imX0rIgLd57MLPV8uNto30
         A/XJskw9zCJGqgu4pLJUN2uWhzhpPFu5Tcc+grCSaiQRyDBY3eH4lRgJJakuB19iZKac
         nfEEjrrXnve47WaTwjRPuXUVUjK1nYl8e28ZYz3KNOKudOlkLE1j++t12J+6VNNbCLET
         WM3uMfkcFaqw2xPsodYHpmcDbRzNx+cW65TTG8A4FDz7NwA6smCk2pHBT+uNLfPSWrWF
         soeui1b57NorFZ/+uYBOdKwHFONHOmmUhNPcj/5QA/sQhwl0T+QEn7QMedLUukOtDdwO
         fkkw==
X-Gm-Message-State: AOJu0YxjkpgazMGqePc/VYOsaFs+ZUcE4/jJUmLLufQ6aKHzh2a62L2+
	wx+WgQ8PiJg2qdGRTCt1Rr5+qr02PkoweBpiaVw2eRzIy3ewEXcB9fnmtVeIIhs=
X-Google-Smtp-Source: AGHT+IE7X9hDipYR0YX/csSCqzOnet8vdLtg+tkdmtHjx4F4Cc1elveRWT2+rBnQl0qvijzggQV9ow==
X-Received: by 2002:a50:ed90:0:b0:55f:43af:4a29 with SMTP id h16-20020a50ed90000000b0055f43af4a29mr420603edr.18.1706600821066;
        Mon, 29 Jan 2024 23:47:01 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b0055ef56f4575sm2182091edt.39.2024.01.29.23.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 23:47:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jan 2024 08:47:00 +0100
Message-Id: <CYRVI1IQ2UKE.15ZGCYLRT3ND3@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Conor Dooley" <conor@kernel.org>, "Vikash Garodia"
 <quic_vgarodia@quicinc.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Stanimir Varbanov"
 <stanimir.k.varbanov@gmail.com>, "Vikash Garodia"
 <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Stanimir Varbanov" <stanimir.varbanov@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU
 entry
X-Mailer: aerc 0.15.2
References: <20240129-sc7280-venus-bindings-v1-1-20a9ba194c60@fairphone.com>
 <20240129-numerate-brought-4660c2a89719@spud>
In-Reply-To: <20240129-numerate-brought-4660c2a89719@spud>

On Mon Jan 29, 2024 at 6:37 PM CET, Conor Dooley wrote:
> On Mon, Jan 29, 2024 at 08:48:54AM +0100, Luca Weiss wrote:
> > Some SC7280-based boards crash when providing the "secure_non_pixel"
> > context bank, so allow only one iommu in the bindings also.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> Do we have any idea why this happens? How is someone supposed to know
> whether or not their system requires you to only provide one iommu?
> Yes, a crash might be the obvious answer, but is there a way of knowing
> without the crashes?

+CC Vikash Garodia

Unfortunately I don't really have much more information than this
message here:
https://lore.kernel.org/linux-arm-msm/ff021f49-f81b-0fd1-bd2c-895dbbb03d56@=
quicinc.com/

And see also the following replies for a bit more context, like this
one:
https://lore.kernel.org/linux-arm-msm/a4e8b531-49f9-f4a1-51cb-e422c56281cc@=
quicinc.com/

Maybe Vikash can add some more info regarding this.

Regards
Luca

>
> Cheers,
> Conor.
>
> > ---
> > Reference:
> > https://lore.kernel.org/linux-arm-msm/20231201-sc7280-venus-pas-v3-2-bc=
132dc5fc30@fairphone.com/
> > ---
> >  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.=
yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > index 8f9b6433aeb8..10c334e6b3dc 100644
> > --- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > @@ -43,6 +43,7 @@ properties:
> >        - const: vcodec_bus
> > =20
> >    iommus:
> > +    minItems: 1
> >      maxItems: 2
> > =20
> >    interconnects:
> >=20
> > ---
> > base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> > change-id: 20240129-sc7280-venus-bindings-6e62a99620de
> >=20
> > Best regards,
> > --=20
> > Luca Weiss <luca.weiss@fairphone.com>
> >=20


