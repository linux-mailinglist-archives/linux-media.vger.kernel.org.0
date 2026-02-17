Return-Path: <linux-media+bounces-52987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF4aIMaYlGlOFwIAu9opvQ
	(envelope-from <linux-media+bounces-52987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 17:35:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5DC14E443
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 17:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CFB4303C63D
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 16:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D02236F40A;
	Tue, 17 Feb 2026 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ntyiyq00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jv0U0c7v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D0436E47F
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346104; cv=pass; b=q81+ZCtY8bJ81QiPoAU2pIJg975xP09GkrHggcRhhp4FOEjTXtYExKfjMSjzwUdJdkO4URNSnoOfxXA75LUcerrPI7OPVf+QY36E6hsKQnH/6jZlB7Ewp3wTfL2uhFKIOAdJN3VBJfuFq6msYPRDH6ZZA7/a9Rg5fWN59r9WToI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346104; c=relaxed/simple;
	bh=fOduQHfnOBnWN0eyuIDOU1ydKPk/q90IXpg/RDM1QR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewFGa+23wVaIxc+zoqhco9r9rdHsjYx9EPf1cGP3nHkwFboxRq3apwnLuDTpjXCPKzEYAyvtfeyDxUsjshzhUbr0ZmSmRwHTzXt5D/RoqdSK1+q22xAupvEkAa0noYF0ayzcG4lBjy+lNxzayDLRccwQzokoQ+JuqaWZQm7pBas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ntyiyq00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jv0U0c7v; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB1jw6912069
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 16:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMRely7AErEzRnlh5Io/kCgcffqQUskngQe8L7efOeo=; b=Ntyiyq00RWaM+fc/
	TUC9DbjyNOs9Japaw2XM8AzuljQaLriO0RaRNhzZ+M3n9GsPJAarbHbNpp6/PEET
	gseZBFEhAk9PFvKbcuqIyVLHbWpwFEMFeIDirSc1YSbOfN/yqyinzYH9i+VfCdBg
	kDFlAw9zf/CAG7A/WEcdtMn15P6upTitTGeFiniShyJXTSG7O3j8MyA8aIcKzfAr
	Q+7Tn0Vt/pa3U6/q99jGevTHoj3vd8AP+ffcTFEdEK8hI/K7CbzPj0WWTsiqxGVx
	UA8XNebusAFfwhYn8V64fiLlKGkejzO6A3SOPbVqMXcxcDe4mkWA+RlmB/lg5Dya
	DtxXDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9u43r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 16:35:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50335bd75bdso386482421cf.0
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 08:35:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771346102; cv=none;
        d=google.com; s=arc-20240605;
        b=eB3x9OGC22tMx9KWXmYH7I2FrqvDpgdRN3iISq6r500zdVi1AfZlTIFmgQMvtb1ADq
         RHO+pMp6fVW4GcCIOzeautmUMSv+NqfrQS8gK3/OYLLtV90EGe84RZ9LrRVSm4pWOfEg
         /hwwmV8n5PqeDmFzXnt3m0bsozGtpFign3NlkjocPP35FIhG3ds3W0h7hhHd88rcefvq
         ByM0B9iNO3c1VDvzkje6UjEw/0OHf4OVm0hvdbWgjimeO20ChtVn7Kehrkeo59HDDQzv
         r+xy0feWDoFrP08f3kCSQVJc8K1Mp9yG22wc3Ww/Qdw64iE8bsDQ3VrAU6Np24eP3PFc
         n2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PMRely7AErEzRnlh5Io/kCgcffqQUskngQe8L7efOeo=;
        fh=co7dVwsWRRnR6Euf01MLVdZ8d5vczFbklEYEl2M6d3E=;
        b=kuG0kigtyjnPZ9J5Cb27tLp1DoH/f8FiLcfG4GKGngEY0Od2nSM2wwoa3q2LyWckZg
         HWTRiMPeibQ4BnfmziqEzrueNWA6gWmq9CbfAgctXzgzcTyQ5egVW8l0s8wuWl2vIUXR
         2ylie9tKAUZ6d443Oo72ir4jmnAwy5qBU5gweRTXZmmSARS1rQJC43rOxQal/HrlWVXN
         wWuTPUZXURzLF/MyyiXC80Nc8JY9o5VqNSL4zijvhhareXHC/7Lu5GqbK+zZJ+p27rHN
         guc4fbCJDx2a8JucP8oL8lNg93mKh7QvypWlFxjFaI9OGSlXQPFVu9+gf2Om1TSEUtvy
         Eg1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771346102; x=1771950902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMRely7AErEzRnlh5Io/kCgcffqQUskngQe8L7efOeo=;
        b=jv0U0c7v3kBIS3xZr/Fpl9OHCwiHk/0345qjt9aqm5ImZAY+H6kNo8/aoYApoGV3Sx
         wRoJgSgBqmUyWV7zebznE3oeD/NvddnlppUWlAVQOGG+WF1B3M2BQNZA2lHKBn4E4+3T
         Lv0pIGEEJpdd3OzN6R9aUgoXrQa+Iw/O6/KN9boZ6x8tQET5Un0zmqRSdAjQFbLHZohI
         bmaaYgRBigGMLnNqT6BYZ2XLHnP8rEmd54wy24Ey7LjfxiemKs+i2VvjPAJUYIL+Aqfh
         0KjJaEezQEqLTyZyiEGFJAdGkATWcPIoFpj/sbO0JI0/Tca7yrqbjPrO2VyEtBxyTIJL
         05qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771346102; x=1771950902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMRely7AErEzRnlh5Io/kCgcffqQUskngQe8L7efOeo=;
        b=ZplLHkmSvhTGDVlukqr6EDVJw3ih8yW7Hvi0RTBso2cbs4rzoLy2AAVwCDo1YMAMls
         YA7JTG4RgY5Q/XFu+VgnuT2l5Hr5EQpFlL8HYOVjhUUgDbD2cVEHUaCJqG3YoshCsxaS
         OodPf1bDNDcjAN3m9ZGXFSz/GY5vwpv0qHg+B6RDVrK5/q8aLKsVDxYfeoa3P/4RHHMY
         amwq15uYNtVe0pyIBngHTwbc9vNsJwAhWzVJzOosofOSPdWogNYFr780510qrz7YvYYf
         99oGSr7o7aEtItDxHo8Dbuo72VuhMsLYKuVq0n+dJtgREttbVGqwRm2s28gjf+q60L4O
         fRAw==
X-Forwarded-Encrypted: i=1; AJvYcCVROlrNq/HH4aHqvqI4Ny6+eHKBPxI5fGqsfASbdiUpa87HN8HRPy3Dosd6lQW2yRZtN15BmOBq/pHhcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL4+9m+WHiEPBBbiVVSAGGcy1Qw0OTfsapQTkZNMWEZJBMrxKe
	XWFecF0+hlu6xTMQ1B3a7hIJ/DQ2dmWX51giWdTf25Nls1zC/GetKTZWm6CwRFQdoM6cbj5BPt0
	dliMaTKV83HaKwZ1GYIiaJkvSpxYJFNNVNPbFzfxnjw7OUer/TSfAfxTc89hNTnsHKUKPHE5+Qk
	cHsY71Xw/vwuZBb41hqsLRIIJPCqeyq+2s3pL3DsvF
X-Gm-Gg: AZuq6aKPS7WMQdZ0lvOL6BQ/2+T9fV217Kcr5rdleAN4qHka2raCllxhtjoCXjixmQz
	dYThOVsS8WjJlWi6d1kWm928pg4rSI9StI4SndxXc9WFczgZT4sb0avuNhg+4G5LtxZyZ5C6+7A
	R+/hpBHSQObKlrpRR8MATbx+Vqts740cBXd483jAZHMQD2cd9djWUfXFmgKmW0lsBfKhqSagP9Q
	CXD12BmR5owz3immL2OFnw0YaSMDMXZRIvJQko6
X-Received: by 2002:a05:622a:19a0:b0:502:f07e:8569 with SMTP id d75a77b69052e-506b3fbdae1mr151322651cf.35.1771346101954;
        Tue, 17 Feb 2026 08:35:01 -0800 (PST)
X-Received: by 2002:a05:622a:19a0:b0:502:f07e:8569 with SMTP id
 d75a77b69052e-506b3fbdae1mr151322301cf.35.1771346101540; Tue, 17 Feb 2026
 08:35:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213132058.521474-1-quic_nihalkum@quicinc.com> <20260213132058.521474-2-quic_nihalkum@quicinc.com>
In-Reply-To: <20260213132058.521474-2-quic_nihalkum@quicinc.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 17:34:50 +0100
X-Gm-Features: AaiRm52Qb0GupIhPu3JDqFomu65fscXc6lKfjuE2PWBiawURp4h1BFYQGueyox8
Message-ID: <CAFEp6-2N21rzNADxPyaLTO4N0vWAoKU13oQueRsC9Esrw-BKOg@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Cc: bryan.odonoghue@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, rfoss@kernel.org, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        quic_svankada@quicinc.com, quic_vikramsa@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEzNCBTYWx0ZWRfXyLVyUfDWgB55
 rWTKoQVfbvtD8ms9gOtgYlNzQPDivvLznUcFvVDltV+/t/P28M4ronMxHy/XGFn6lncYRzPTtfD
 2mrVaYemd3MfT6rvtrO1TaRXZHwy07BbiVVX7bqGoKjcT5mlcgUU8Zy7ilKILm3pHfJ+zNDbJP2
 13tUHxSkjIMpr6ILXc8JJc/0vR4ZnkmD4MtgoTAri6bJoiBmHBUxYhhvGrXCPbnJ4GioUFdY46+
 YzxAyetXftV/zZ/c+DpApdFsSVH48HIqDsIX8vKAU4+NWWHQKC8K+r2kE1TkzGV8/BI1n7FTBXo
 zeNyeGYm7A6dv2oRP+SA1Xveop73Qtokt93WYRcFdDDhbGHmDN3HPNcktCVU/LwX7nf3wVoFpp2
 R9wK7gSjfLmmnMWJUdwDioIQYewsARyDUdzju1HAylIEjlyfdi7UhyMFaDrKk9uOEc5D0rEkhUo
 p4DhSFjPmCeG1EizU8Q==
X-Proofpoint-GUID: dCzO1LIb00_1-FjiaH-bnOFcJTDT3cvA
X-Proofpoint-ORIG-GUID: dCzO1LIb00_1-FjiaH-bnOFcJTDT3cvA
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=699498b6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SK6ENzGRsuaxshVCMHcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52987-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,xs4all.nl,vger.kernel.org,chromium.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB5DC14E443
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 2:21=E2=80=AFPM Nihal Kumar Gupta
<quic_nihalkum@quicinc.com> wrote:
>
> The three instances of CCI found on the QCS8300 are functionally the same
> as on a number of existing Qualcomm SoCs.
>
> Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
> common fallback.
>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aec..399a09409e07 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
> +              - qcom,qcs8300-cci
>                - qcom,sa8775p-cci
>                - qcom,sc7280-cci
>                - qcom,sc8280xp-cci
> @@ -133,6 +134,7 @@ allOf:
>              enum:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
> +              - qcom,qcs8300-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
> --
> 2.34.1
>

