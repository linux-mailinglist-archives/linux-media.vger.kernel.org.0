Return-Path: <linux-media+bounces-57562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oERGIFM6ymnD6gUAu9opvQ
	(envelope-from <linux-media+bounces-57562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:54:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A44173578F7
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5526A3149961
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B593B27D3;
	Mon, 30 Mar 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8SvCnf+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wg2m8og7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72CB3ACF11
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860030; cv=pass; b=tyxX8SXKWrnLaAJV5TTbIYbI2TO5w0d3H+NfWTMKylDTEAw6jZYeAUr7STKpsMZkbaDaArnckPhXUzc8HoNGiQRupjNpiNUykGtoRYg1+oJ5OA3M2x4h7tReO7Bh3QCXR8zQsOEwwN9W/c9PkMaOAf84ULleGpTztYpQSLy0MIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860030; c=relaxed/simple;
	bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MaJbSzLDSO2hX9elMO1ublyyeOY6wHPGo6v7eQ1oniwf35IkuBB3BS9DSGBdsKSV4CzCoh0OvFgcgI0V/+cXvAyxxF7asCMRoqCbZbiFrecEo8w1uBs1HnlGPon9fFPO8wFZhOUu1T3z3TDL2t/FPpkrvUqc4gQMh39T7Ogr/ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8SvCnf+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wg2m8og7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U78Sc34161896
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=; b=F8SvCnf+rzcEb1jr
	SP2tBjclokgByKqhpYAePnw3KG3vXyJnA4Vrr6P8HpQXbn1WnM5UXetW3bwS1+LU
	ahbmPt+1zgpR3EDj8kWYONI7+BOx0/eLkLyF35L+3x+FaCniz5wih6vijJZ55kYw
	WtFwQuqGDnJgN+3meul+yZDWzSwXl4X9tyJ/1RHfYD6W3pnuBWLrV18qB0gNBhH1
	WSs0/u51Qv0Lmmuj6bSK9B61SEVjYlxeQ39bCgIK7pk8kvQN1qf7zyOpzToDeTx/
	Nyxzrxk+12YPsAHLYCPe7J9F7Ob4LuWImkTXxV/f/6QswRkO9Zi+eMY1qYymW8LY
	yTxuEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7mharatq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:40:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so137618061cf.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860025; cv=none;
        d=google.com; s=arc-20240605;
        b=SUArEZPfIl92e6GrvPCUt0lABEKYVHFKN1YQa6fEQPMMkIMAkK0azvfdpZZTfrl4up
         nDsVkz81oNce5QocpkBJEy2/f21I98i01p3u/uhJVi0xY/2LWETTnM8Z4HgXbJDdIw+O
         CgNzTQNyEs8forC6Gg/wUoSsJ+nHvFvTkIpZhb6zfgtdDjDACIjove1hhucTWLWfnK2p
         yZ9Jwx6U27Rr0kBsv/ExQjnDuZwEHTaRNZ/7w7ADea82F/47gM4OIkBCwwjDbETV5xcT
         bcGo2FHxZKwfSAIu/KVvk2qtmO2hU9TAifAyL3kdaKgzeRfJ+RhFKQwLX/ngB5DcBkrI
         ogYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
        fh=OfMwGHpsJfTs8kI5i8G4/PSZUqWg+p18cwA2KOk9eNw=;
        b=Tdsxq+ZLwVReRi5Ps32wmNA0p9YuOeibCcVybdMGm3TwsQtaRXiGnZBQxAraOaMu+y
         6weUiWV/e2rKIA1YNTvScwXjroSvcdYzdjP2Vx9lIoyyT0mmknFpUBtG0ayfen3u0taE
         rfsI8SyenVgGSW44yKGAY7bmC0Fg/b3WHdkQi4soWBsI7MiEAYxNVJadc04AlCyffAiK
         rZFizgfDuir9LpwtO8R5k1gYx/murdb9Orc0fpexDOFXq4BttyktS1OlsXUK03I+u893
         jy2Mciw7Bky1HomkXpPucP6b1gFSy1Jzot/lpq2Q0xZhIox6zzSAX7pY1/hVqKHUQFA4
         IpgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774860025; x=1775464825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
        b=Wg2m8og7/FEOmvQmm+DWaNSOthanxPrgtiHGoC9/aLKTUumcb2xKV8YfIpjX2aCn00
         QKAE+hc4Dl/z5bslp6Czes6ZYRr3l0YesTjZqrBPZRtENWJY5C7FtJOVKx+S5HWsyCm5
         MaKFsEUiaELymR1rP0Fmnqd+PMRHn2Rwn936wY3+xguy1oHoF83iKU+nBbgimeyuAFqp
         syLLfVbI9DOjWQGiwQWL5FRHIBN0Ow2a06krXHY8A/xKrmjvACNQP8BWTed7GqjTHEqt
         JgxiNoLj61OSFYPA2KNO2lUKT3cdTk12DZZOeinQl599rg35SiJ7JzwyFUGhxWR+a9cd
         d+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860025; x=1775464825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWZgHHlyKFfb8UmOMQjxbvukBuDEu3SQ0LKetZzLVaQ=;
        b=NELJlosCWiw62LYDi1fqtowsRwmuOLqYZ8zjSgpF8d84mH6o6vRfISeFNHG5ahGgdD
         uX6zfjb/XU6YSmCRUwuzWeBTtL+ysahKrR3jPUbagLfAyoYmY47lR03q6zku+7SBbUL0
         pZjt7YVy/GP4b2IFIwukzTn/J9g5+0A8ZKu9tyWrpM/JZ9TX0s2bt0sOrP329g1nOd/N
         Cj6+t1w3lkLi4NZShJJmkk5UQBlDf+L5zQ2B6OKdca/mhEAfQr30uqTH4bvzN+aMv9RK
         uZBJqyDATPwIv+v+Aj7UxiUaxNUAZoVMaQrXUJ0gW10H1iH7yhEHHHhgcVG6BzYgMQ+X
         Tq4g==
X-Forwarded-Encrypted: i=1; AJvYcCW2chPKF3b+KqOPebDsNkTJJ80VSGCsDYkC93b+5DIC3LP6dg6jUszUT+VP2Pylslhx5IuaGjhRmSJ8EA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk6qdpNyRttGOAKihMsBoK3Z2cwMEjLnsaNMA1LfPXG2cJlJmF
	JOvdA3Ek4xsKh5aNi3pE1CPVkExOSppK94vkujA0fiPbI/FXCeiEdfXTfCI3gT8nJBEOiYu7hMY
	fqfrdllualc0p+ikxl9uq28RGBEGAENTjZdKPjzxfRX3HViYKy04Sl2UVc5KrlPgSPwSVnJYOSL
	gsePbTCueR7WJPwm5obbVzkJhzcOtTljIHPHaGmL5L
X-Gm-Gg: ATEYQzziAdPBuWwYyGC8vLIGDfDD3+2QO4gxZ9SwQ3RGADc3uD09kli8mFatap74n41
	l98IWV106cV3mDWuKjHfkH0pYixe4Q5ejA+H3/nVd7L1KP9MwXT8pxF49pPgEnFI+yZ7hQ3ajoP
	tfpNIoKQnchtqbQq5VKN+7CaB7gAwRkZU4VHZlcE08wxHPC+SPQPfOBcn2AQzpri08DJpsZgXE3
	BMl2ObrdDAcbZ5JOdf2rQaF3VbbNwvGSjZ7tIY=
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id d75a77b69052e-50ba38efe47mr159893691cf.53.1774860024922;
        Mon, 30 Mar 2026 01:40:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4a17:b0:50b:5336:1d20 with SMTP id
 d75a77b69052e-50ba38efe47mr159893451cf.53.1774860024529; Mon, 30 Mar 2026
 01:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-5-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-5-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:40:13 +0200
X-Gm-Features: AQROBzDa5JyLSXqlyeBHjiboYIc2tAkjG5mwWLhdd8C7uKXweA2tZXurYaWdQV4
Message-ID: <CAFEp6-3w570bA0=wRLJ_b4kwwcxVbV3zs8m3JL9nCwoDTY7tTw@mail.gmail.com>
Subject: Re: [PATCH v11 5/7] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NyBTYWx0ZWRfX2Ztwlz19HQAi
 NVEc7i8vMpSWmM4bq6f/FQ/zWclO/k/WOw23wcG+1o91s0mQ+iY91QUjSRBbA+DzRNUCx05gJec
 UOucLbhDWf2J76aAVeaMozkhqtfUGOCkLZZ0k14y6O5fc4RroON4p5wYntTIIocBFB3Kykax82s
 XxSb7tXO72EyY+zVMZS1/Dp56k3jZ83eITfSvXNRNabyGknBRoYcllmbz/5lkp/LzZmPzHiHyjT
 zh1yUslxiTz9GYla5clsC4I9dM9jYl/eqXrK8cnaV+Z978vo5ZYJIgM/Z/QyJ0TrSUK16maXgkI
 XEw54EPfIic8ocwkPU7ELEoojSUkrD4fGFg5VVtGxbPxNkzFFx2aHdAP3443/gMLpNQUDqzzikU
 y7/6cLBR9Zvan7BrKdqaGD2UMpwTQJwKagCcb+QnAkc+Igzhdo7PfTMRDaYBV2ZiYzZ0/JzQA8H
 wG1utEZUCXdXrB08Eow==
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=69ca36f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XIB30I8Fq4NfyXnsoAUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yvybq-4SmS3JfHGSJaL6MuPdHQ776a_f
X-Proofpoint-GUID: yvybq-4SmS3JfHGSJaL6MuPdHQ776a_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57562-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,oss.qualcomm.com:dkim,linaro.org:email]
X-Rspamd-Queue-Id: A44173578F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 2:32=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Flag which SoCs have legacy - builtin PHY code. This will be useful in
> subsequent patches to inform PHY bringup logic if legacy bindings are
> available.
>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

