Return-Path: <linux-media+bounces-67168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Md37DzKmT2rTlgIAu9opvQ
	(envelope-from <linux-media+bounces-67168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:46:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E16731BB4
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:46:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bb5OIJFe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M+te7uFT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67168-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67168-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C4533087642
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FF233260E;
	Thu,  9 Jul 2026 13:42:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47D433065C
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604538; cv=none; b=rkEW38jYKRR1eEaE4wRM5sj4rz/wdKNcO+3FmwsM4wE8Dshgo3o9BW3oHVbzaN9S2t8V6begeH7TiB3GnI2GgjSkJDOtr/Piq5JjLd6AUXXJna1MGkGH2R7iIEe7xzc1gXfWFSmGfHkVClsvBTcxKCd0BZR4MdeuFLVN/kueiac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604538; c=relaxed/simple;
	bh=mn+e/RylLLe8OTePgCv2X/kFcuAkbIe3sFltrQBvOOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1UKhAzWzir/hOvnlGxJZ24fRHthgVJJEcOuOHWgGAc3g2ooSMKaRZrg1LifXWBf4HfsggaeD+dcPI+Fd9B0GDAYRi4w0VndSFUX6LEtVCnSqknLot3CYxZyLa2HXn0IbroBa1MvwHw/8Q6ZFe4iqRURlljRyncbbyJhrIHL/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bb5OIJFe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+te7uFT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNJ6d1667669
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=; b=Bb5OIJFe/cWD31/4
	dABkgxDXNVxcVI+R/twBIQO6Ar4iDQ6eH9CvaYRd5q8IzmKO+a1ESqYjPfSUyLhn
	k2ueU9e2VIYi4JrwC09oVtS3bgPlj5b18vAlTWpOpRAEyoyoX4Rzz6VMMNAiTGu7
	6PkcRY96W7xkG4MTD3u1sz9p7i89Fyfu0YD8uT4ZLVjqeUjKJ7v0NsyKMTMN9lsM
	vJJmQ1KbrKc3DKrf3Tml0XupoCCyfLDfjnag9bG/x1oaZ3vA4ZWlslhHs8NkJCMS
	QO+yW5tTq5eSy+kLjAMLlNUrn/oiPtBUmxQN5TMGZIyK5H0blMdOBd2pf9as5cwV
	4glooA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6m1ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f1f1e0e5so511228137.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604535; x=1784209335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=M+te7uFTZg4rB4GqMR3sPwBXZXfYSNRyysc/8m0SNOk3PtWwFtJHchs3Nti0vZMd6N
         gm/jJ5yZnZUJp28RJsFugzqvsC027XIT8w2u4Dx2S4GsnRk9XFV7ObL5nTdM1whWat+F
         TFPUPLMHmcPyHrERDY17xris300EFyAOrrTP4/M0l8CGdqi6K5ZKuoZ0+06OlTA8NCLP
         J5JluLSCh4RIlEyPfBNIWYwsZFplRli87pE8rHApl5g0Lo7kkAxs+9lZqwQznajLWrUf
         tsyffAodUs/nWa7LEH8X0QOUw0r7jdAzPdpT/xHQgXWgZrbl+RqvCRMa2o0VcVFyo7Zp
         iksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604535; x=1784209335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=Fhlv3b9PWwaWUq55hsYXn9zpPAc+OWfrBiu7zJThj5IT9mrtcaIk4a1j1ALp3Slhq9
         sdtBHKLNZwrrE9xQgQLKGVjrIJOI5c9Y8g5dn+bdj6D29e10OFd01c4RDrA1KEF7Ua5x
         Z+xKeXlIy/PtpTugZobZBZvAGCLS+LTi7nAQNps23V6rwJXT5m5tCaPIYFCIQlB/Gno3
         Jwc+1atKnikoKlOrEQIt8s8ZEy/+LyQRxtqoU8f+lJ0Z+/koP13u0WWWAExHr+puvT8w
         7QTiWcJmX5mZSVeagDmtlHMh6UzdWxXmYld/JaagiaBj+cSn/a18mifwgkNeXEX9Fb2N
         uffQ==
X-Gm-Message-State: AOJu0YxQ2yvrW1PMLorTFK6K66JalpsskYuOEwqa/ezrU9XGYseMXtBm
	Az7+3KNwEu6W+fZgT/CPDVJhL0EirR10VgVdB8Zm52Y5PO6RpqHYAa2WQKVvyqrKOanHAIjfJjs
	1hR4TRjbq81UQOmW4UGTfKqDy/M8V2HrIP8/XpwcN4RHSFkUuIOD+tCOSXi4n6ELM3w==
X-Gm-Gg: AfdE7cmiXh1cyZP7ioJ0HUiMjNYzUdOToATGA2RBPY9JgFjdAfHCroZIsTCYC4X2WRi
	sIit35qnmyhvypGFB3hT2IMkdwOcFQ8l7k2r8rnd5ItYDRCkfSBA9FLNe79NYkPwdk/25kL5XQH
	S95Z+amzQ95IiDisbJOYy9klWN7YGWbCBeMCRfQFIOMfpNATr518Uv6S6uy/gXAskeomuELiTmz
	gPZWhliitO704rwWeoJN7yw5WnhPZDXqMqQLJ6YMSyfFGQsmeMEOEpE9ybR3Fv6aMph49d9ebN5
	oWan688ltc7H5LSDqjZX8fwWFeHcvsJetvvOjUMDiHCU0EWuOph1nU85p+cqRiB5qsvav1uXB7j
	zbkwrVn918vomFKKSyVJiVW8ZrCly3DQGvMs7x2XY+VaF0IJpB2CaTX+23p5tCgjoiJW4IP0BNM
	NtrfvNqmlPiJ0JknPWdJ2ety4Y
X-Received: by 2002:a05:6102:5785:b0:738:ecd7:198e with SMTP id ada2fe7eead31-744e00e1e4dmr4270278137.19.1783604535050;
        Thu, 09 Jul 2026 06:42:15 -0700 (PDT)
X-Received: by 2002:a05:6102:5785:b0:738:ecd7:198e with SMTP id ada2fe7eead31-744e00e1e4dmr4270256137.19.1783604534516;
        Thu, 09 Jul 2026 06:42:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:57 +0300
Subject: [PATCH v7 06/18] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-6-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jlbWJ6BnLAb8hDHnLKbkTUpBs5ZGORWEUsmmVGvPwio=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6Ukxn21zKTOomCb7ibYdxxTBJVZpsiZGP6iO
 Em8Ptt/Tn6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1RCTB/9L2Lw0/DwSr7+9p6VheWld0Oh4iBD3Yn1Q+ZyUPaHYjChgYT7zQk0SEEx8/PGfoYdWZs0
 bgd597m5qbe7xUawx+GXqQwTdfSol0QBvBQ2QcOy2Em6009TTLfGEAye20hFCshN0yDZz5urqJi
 yk2lh/ZOJy2o/2iLNVU6SnB6dcqZyZKuj+/vI8GG9RXNKr+fECXQ9XXp60mSMSc2mLODof26ZQ5
 NpzlJmFxHZ5g8D91SFFkDZcG+sJLivpQtSF1o5/DXlNxwWOfxbbzrHRhnl8zAt0qbyA9Z3wGvmH
 IigFeBAurnEXD47cuxbTmnCd+hMUdrbSWg7TM8/mLLkAWZwL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX44BoM8WlMr48
 OIVYtvTI9Smq+fViNwxVKXYlnVg2Z1Bxp0/bO0+kGrmtcEA8LjzoVC132VtcMqCvnyUz5ffekh5
 PlutOiHHQVaeycnJMG9A5Q1CyBpnK38=
X-Proofpoint-GUID: GiOKIOZYTdUDJOcJZm6PPFrnXcDhC3nf
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fa537 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: GiOKIOZYTdUDJOcJZm6PPFrnXcDhC3nf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX2JczBSHK9niC
 UuubnMxzKPY1/vljR6hFEX2whBN01XwzZFKmGdXGz2/iBWp4U0y5ZdfnYXD+LLJ7/5Q9zNuFEmA
 xep0mUvjeP4l+YFm9oouaSrz+j1+4HRikoSnX69e5DxESWC+uxcUKBIKCtStYyZoW2FtUo5eKcG
 Sdz0xwyU0RIJACuMubvEPnjEZhK0AHXUug+pjNPykxi1SimHNn7Svk9m2Yt52v6CLiJ/w5Unw7d
 IoZahlZ8z84+4T3WMgbAnXbvy7z4jic1pCiRcNOVBN591dxUhrzTN4H856T3uFPfGOFuT5jzVh2
 MKgH8yh8W+WUPRsTtpT3o+IgILicbKJLf/BW93vkRAu2PHFSI+ocZ+UW4ukTgl0nPemT49ERd2S
 5zS91YRKkJUTg6ZKXrtU55h9yr8GtsygcRfvo+ajZ+r/h0AaXpBWmVj0qTV1f0pr7fLE0NtjUTn
 7uwnPQQbJU8a8+nWbjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67168-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4E16731BB4

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 2dc121a3f5e8..dd2eeae0d9eb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index a49113b0da23..375bcd923476 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -485,7 +485,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3


