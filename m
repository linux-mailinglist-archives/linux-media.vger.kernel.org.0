Return-Path: <linux-media+bounces-57380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAt9DjgFx2nWRgUAu9opvQ
	(envelope-from <linux-media+bounces-57380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:31:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAA434BF7A
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8B7C3023DB7
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838E9393DF9;
	Fri, 27 Mar 2026 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/0vK7md";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmN5a46w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED40570810
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650673; cv=pass; b=oOXHLVCQE//76XEzzfLrgam1fFt6w3B9tAJipFZ6h2mZzOaplVGzel+C4QiKeysXYxQBWr3iUbvt0kQaklLcZcqjT6+3RGt6ccWIsDPn0coGLKT3MaHztytFd1qZssyksFrPO5e0xilRDaa+CcD+lwT64TKHQt6wR5rWJrh6AjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650673; c=relaxed/simple;
	bh=7Wd4WaS9Tw2LVyuZGToThgOcjG4eTJFKipKnBT6ahmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPW3Ee1G6FQ33TUs+uCaahzsM1t2+OzqQh8AKMioMcNqO/kH0+1eSU+sNG0E6EwhX3erEsMlqQm/UNNIExDChLrQFqOoSUbwmHZ9fKKlwYyuTk/LbFnLX19tw7Uh47nDJ8d1Y4x8s/IArvaGWmJfKdigu+uUq+FQhlkBAyfb+lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/0vK7md; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmN5a46w; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLflw21478450
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v7WKFHZa01ynUTDVkoNUyIYc
	RPr9NH/0nVWPZPdPQ9k=; b=Q/0vK7mda58L9rCaZiemnuT+S0aIHs/9Gy437+84
	nJ84HGm6v3yzi7uWYQZ1bPNgfbpYBJBIhNFpfxiJlG0tpthp3LgRMRzktJZzL5AK
	ROgcIUfbDMKD+W4YsLIh2zvOK0arg5L3BbNv5u5Abs8y52+zFpubV2J07rXvnd0o
	fX/tJ7wy8Bx+bfdCrGc9dktB8toXGl4Ji4sjFqCNRlRbIW6219WPxkFQUox/R+D0
	gUYFXvVj5GNx8MPKyPTjFtq7y/W4sOWUmbQlBtldY+Xt5ktx8Cupu++iOtoJsFic
	fTjT3+UgXOOvLk4zbaiXUuvRHuX0Fc07AbqjEOt033SKjQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6111g8fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:31:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c69a734a4so2120330b3a.1
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774650671; cv=none;
        d=google.com; s=arc-20240605;
        b=ktbEAVe81hhlr2bBUgtls+bkdYClXOMhehsa3DRvtO4I4sCZ+GaaIU0VVrc2UBxc7F
         2SdMpfoWcLhg/L3k6eTjP8LX5MKks+L+rrhkHhfZY55R6NAznscHEusTVXLfsGfJOn6A
         ziYYcaQcEjXGu+XlRQGTRO8aQpMRb1AWFi6H7tcPGPKqu/nIC9MpbisX5TaWxkFHjc1D
         6ieAuZ2k7D2SCLqlKolLuKjPJoCiAP6iHPrf5+mu+KjBh70BhSz+6DviL+PFuDXjXZ4H
         JzRC9G85p55z9KAgj90dc9yZvJYoxtRdfKSnme9uBf72GaOoK9OsEAy2GCyV5jjA0i3F
         ST5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v7WKFHZa01ynUTDVkoNUyIYcRPr9NH/0nVWPZPdPQ9k=;
        fh=KuM9WWnGc30mzfxGDmViCMl6qnz+QlmmHfjdMsuX2zw=;
        b=b8lOXmKW1Q6VIjZaar0XEhX4H9hKgJJmae7YuzEfCJ2RCFISUIPaXO7m0j/u1bbTGR
         hHWPlCLhjrHEHliB6nRnXafhPMfOCGsOns2/lrILvSjdxNJEIDEl8mRZmHsPIDz/kXsO
         ztdIPrwD3jp69TuCJfVWzNl4tGwwT1OxctB9ZrMHag5zawKxGTJHgQZGSl6zYjSTgrAF
         BuZx/GfHuyNPkMKyt2PzznZzmfyjvXixfTEqmyDKybPgTPzGnBm6FDsKIrPE9TEOGq1S
         Lmd6GPVIetAsJy1xTwRqHpF69QNspFegwHKOkZADKrmkFvwCcgbwKpDLqSyymKJMh0z+
         Fi8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774650671; x=1775255471; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v7WKFHZa01ynUTDVkoNUyIYcRPr9NH/0nVWPZPdPQ9k=;
        b=KmN5a46we2N37KjJDBnAhup7ENWYaJ/hM4PH16BKqR5XsD0rEaJld7iaSE+GDna9RW
         XHPFrn/qQX5bqTpxsd8d2sTCmjbeDMOiBFkupHMEcYeeeSyB/p3pfagC8OjobcmHgcrL
         K8mWqp5KeV/OQhQ3hBPHlV5DXGYzmX8gddkff+6pbARO8IFIX8F965GdMSeKyrKLDPcu
         yrPSyGmc518A5Qpd/skXZ24iCxczcHdEDXbaID+PJVW556EG0UQSkrBJ0IGUIusn836U
         hFrc0wLJ8EXE0CnjVEFDdVxv+7yE/OfkLcptl6VS6EgcBOMbD73kB7ef9K+i+cpi1P0r
         vH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774650671; x=1775255471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7WKFHZa01ynUTDVkoNUyIYcRPr9NH/0nVWPZPdPQ9k=;
        b=pk4qx7Pd+jvKvfjCNs3TXpxP5aFs5Z3r1tCxXLs40ntYH2WrY+HIXcrGJsTYchf4mN
         pwhsb7Z01bdbjaJoBlV21pxE8u6WBL6ogxvwOG8S2Vd4yEcDlRUkadIrrZT436A3WdPU
         V0vS8fzPk2HIzgteoHYx8QdA6uysLqhfC3O7RYvgMeJurPAH7iv/D8BLekTTQCmhYzWC
         d+LB4GMWFrpl477m6PD0leW7k3aUGbEEinqMVEJN5r5/5cCCn2xqrQKqGexdOzrbPpV0
         zWrfbgeOL4w9zaacMlrd5t1ibPiyGUMneCuPohVU2KyZP+HE/sWN2S/icupC/IPbYW6f
         lI8w==
X-Forwarded-Encrypted: i=1; AJvYcCUm+TCafLa2lF7l7+yELN8JUgI/kD/Crhi60WJAsZcjd1AsBH/+7a80wmfPl6lr4BiDwS4uFQhCScjcrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh8HHK+xCmvBz6X8IyOlZXoZUHggqNmcuHFsxEtL+YfwULi6Xk
	c77sMU2P0I+jeQv/pbIE5MrPBcAC0C/lzC2rBsjXtCct2Rd/1/vFp1EMFmrNRWBPidDm/bSuu5U
	os7UrMBG9BlCPf2kDgQwGEP3IqdMtGZ3WlHs4cOZKKZ8K/Y7pDNQU/8yunn/FO9+7F3U4UNvCmI
	Tzs4HDpJak++7RxB3+9uwiYmG9/ANbPa1u7Q2/s8qA
X-Gm-Gg: ATEYQzzvtzeMikKWwODRPlpOb/78vHqyC1FIRUlgMQYg8xAGMKKOQ8NmJkhPMf+P3J1
	sp/mrLT6rbgnyZ3bWtRECE3xGfxxEEUWhHvNT5UdJEktkVCQYx98XuT4UHnUfrdKxynikYfq0kz
	/4kLo5Nn8CQtQ8QQ6DxjqpZ/Lk+ioYGUvzEUiE//VVnOw7/JVS2+cmoQBzOfvdjYWt8IeiF0SBc
	VQEpWNKklGNmgw5TDcVkC7IdEj8WqunGhUbXmE=
X-Received: by 2002:a05:6a00:aa03:b0:82c:75df:10ab with SMTP id d2e1a72fcca58-82c960d66a6mr3844208b3a.58.1774650670376;
        Fri, 27 Mar 2026 15:31:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa03:b0:82c:75df:10ab with SMTP id
 d2e1a72fcca58-82c960d66a6mr3844167b3a.58.1774650669762; Fri, 27 Mar 2026
 15:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org> <aEe0uBeOge5s3CG521FGdJhY-snL7v7U2KXbg1IAqMn9oy6mslb2GJ9JfYCJ3RRE0L-Qr5opUYFUyBJp3qEraw==@protonmail.internalid>
 <62zcubxembr6iat4d7n3o7aecqtx3ne2a42ilxfoap65oaefhh@mecahghgrwrf> <6c52f934-1b08-4e93-a753-d4c90e827f1f@kernel.org>
In-Reply-To: <6c52f934-1b08-4e93-a753-d4c90e827f1f@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 00:30:58 +0200
X-Gm-Features: AQROBzBzJ3bpD6jVINfR2GFtsJ4wmBDV3W7m5wN_gCvaCyk9JMJM982w8JUW8hE
Message-ID: <CAO9ioeW2Xi_yQ-bqH0=ST=dx6-1bPjnNEeT29ctdHp039_yeuw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1OCBTYWx0ZWRfX3BBOjITdlhwz
 YykNBypU3ohw3gJQyy0UZv6Ib5jPkGgAfFgAFTvnkKu8vd6riphbQ+NwZDSAdjZnsMs2Fa5oHqB
 zybRzkNuJ/psAPOHxsTwHeEdvaD0ifEm2QNpkIggTdx9wV/SxNeThvgfcdO7YIQ40i8OzHHmJEC
 e11ERiyVreBVnPEtYsAXbU4L3NVkMeLr5QwYpLJncq693Bk399Ki9Jjp1qSdDbOD3x7HDgk6WsM
 8bJXuosTyQC/5mNOUXUtfIHOT7k1LbwmoFv8qdr2T0bZ63OgWpOmJfzclBmNBwfTAhefwA6lhwU
 n2tLMBBLgwn0KsMuTVFtVlSShNb+bvjIuWC1UeEsGkDYc62IsmmxdxGsInaX8oZQELpUzVMbrfh
 8ojzj8ucH87R2qPj0vlCZJFk/fHLEWbKn77TSuQKcxdZi/nQKmaUxNtgYW3t+sj6CxO3G14mW0G
 j3iIjrWqIxpxwIZOaTw==
X-Proofpoint-ORIG-GUID: xmdgfEy4pEwn_1Pv9v4eTlWUbYL1V8W8
X-Authority-Analysis: v=2.4 cv=aoW/yCZV c=1 sm=1 tr=0 ts=69c7052f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=M5UCi2xDz22XXY1QiL0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: xmdgfEy4pEwn_1Pv9v4eTlWUbYL1V8W8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270158
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57380-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2BAA434BF7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 at 00:11, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 27/03/2026 20:54, Dmitry Baryshkov wrote:
> > I think, I've left similar feedback already. Please rework a single
> > structure-less table into generic and per-lane configuration. It doesn't
> > make sense to repeat the same configuration N times, just with the
> > different offset.
>
> If you remember you also said that was fine for a follow-on series after
> merging, and you asked for a commit log to that effect.
>
> i.e.
>
> "The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop."

Ack.


-- 
With best wishes
Dmitry

