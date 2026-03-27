Return-Path: <linux-media+bounces-57389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHCcMVATx2lUSgUAu9opvQ
	(envelope-from <linux-media+bounces-57389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:31:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 219C634C4AD
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 605843024A56
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A532C11D7;
	Fri, 27 Mar 2026 23:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNmb5xvU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dig+jQ1U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E32EFD95
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654128; cv=none; b=LmGg3nW3u1LLbz6Zow/NQiUog23Du4d9KDdh3vrVPaCaZsK4LaHrUiI5KRMgspnQl1nbIK8o2L8eUC4FT6LLfvsnCyKwcYOobBYYwGlHES9TUOkxpocMl19yylDfO1tKzwF5uw0rgpG1QbzUmxHuzHFX8ihKx1YIZwXHcUc9Cjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654128; c=relaxed/simple;
	bh=3MLAIq+HiE/22OmCF0hxluJv1C7cQ32vE816B4yopFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pMw1SdkY8J0qcXYVTk6oJ9pPgwJ+vOMeN9LgmCMwIagMvXwk8xlcX8PXREPScMg0pZ5M4fFuzVwfy/go5K03ePXJ2Ku62lL6I6ic8hmuMV+x47ffbNZzfe0LQCyBkfF6NS/ire6hL2dr1tiIMk2aHQWUpqOP4kQ4oGD5qMU4U+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNmb5xvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dig+jQ1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3oue3832612
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TX+Lzt/onrG+YcysqeRqF3
	L7a3SVYiID09xWZ8DQeX4=; b=MNmb5xvUAcqaFaoX6lPGWNMAq+ZZ6xAoCho3Ip
	HwRVslqrg5GOMa3K0oMxkBu8mMqCfAM/AlvB/FRpPlh6z8rm0HbUTpNHpSrAcrDV
	vvjM6+KvYe77SS2lLdzmCovRMGH7JSRePWYyfzPX0SsyUD7YM5O3K0BOVFGtXKhU
	sLnH7QRSUshdwOwcT+QuycNfIQ+5yljYNDkFMgFbfG014Xmqw5iOM0RE9RLCfZWI
	YKemaCFKBcWRGIywaSGwsxcCpR9JDcs8njngt7sgoXZ9jDbjVCnGX7PjWV7KL2I2
	M+eNU4/hQ/mQb06XQJneVpsgyqTYa6Ht/sSiihQmR7i4bsaQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5y2grrb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:28:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50911c94db1so63308811cf.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 16:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654125; x=1775258925; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TX+Lzt/onrG+YcysqeRqF3L7a3SVYiID09xWZ8DQeX4=;
        b=Dig+jQ1UZNhakMUK2JPXlhGgRdGqtiTgXgyqdKlCHWIautJWJ+vyD7oVUIk7x20JIz
         x4TgoEIHGcfaXQAdQoLHhldKuSrxBCGIZLxM942xkTmDL6iAwoyeQumqhfYFBfiIHXzP
         AUkXNHStqvicZjEXvXukYvjBqxMH7bewq38W6jqo7ThsQNOxehDO6Yq6P0M1h8yUOfZw
         oYsqAFbW91jOyZJJgO5HzDFKD06GhBTsh6Ext9s+5+SGywAZLCrzZ/FSTqXlf9koyzYc
         NnoRRxt+1ck6BBO3pbKutMUth+xeFcNQ3qImz5jUeLqPvRuLnaNh8GSn119drtZx/cpD
         benA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654125; x=1775258925;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TX+Lzt/onrG+YcysqeRqF3L7a3SVYiID09xWZ8DQeX4=;
        b=VwmsP06czu/77eXy4uYKq/0e38Ch7oxWSjKSrwiNTHEyeWKnvmqVwC+yCiH8dPPjFw
         msUJNRncV9q403MZjwJdcQBEDBYzn0IH54iibagB2W61KA9qlCmWu36i05XPmj4e60Ub
         /ycuKLKsbAbFuhdUjTSDnJG44qjCL4JVHam1NDR4VhIPANrza1bbGibl1v++y83r//mo
         dnpOGR5ePNdg3t/ayIjfoBbP1Mq1L2fOMh8pspKCg2wpynPxYoBjzf1ppagCLW5iFSG8
         Et5ux3TdspgosUZwrCmFO4fv3bWn1eWvzJTNc30ioqQ0YZniyNJuwg6O1+T9a10GojGp
         77Bg==
X-Gm-Message-State: AOJu0YyoW5Xv/6cpcG4AC0ykue6eeyvsj2TJzxosn+kkAYb2dimokmbA
	LNO6FM//UsT252FGqThfjm2b9qiNi7ixUG9LpUj4b0qezr+lM+4s3Re8pk6CQ27xvx75YARvW4F
	DQFvo0ryLSnNx+bCTZ/E+Mde4lqCeQVciW3rMHUzQTX72CX91mWbY3cBKxxyRMvZVWoUw37EwgA
	==
X-Gm-Gg: ATEYQzw7BinMJvq98+q1EK15eG3qdAfRO58Q1GFy47B0QVr2wMXSbFZOf+xgLEvzRmA
	wBNwBGToKsqdGoWrC9aKQqM9tYiMb/TntckqRdKPF6KM+uw3LwyFbXvupIecauB+6lvXIPafrh9
	noCQGL7eRlZgzWoGxSrCkRHsV3o5+rl6IpS8Aw6Io+Vo0CQ6CZxst4IddOgkh3yRpGtyRD1rZS6
	lbAseBxurMwPd6xt2YrUb/pL1g+KCM+i1jxRUKnphyDXumYWnX/UV5yRsaMr0D3QS0bUU00cJ3R
	XAfOde+qNU6++VPxNA+bEd+no2Lla+vHHm9XN6hOxCYZp/dX3aFuP+xEzp1jxDlcd58hjFEUj32
	02QEmkA09g7FVNa57x92juowSrKQx3p+UJ5AX8fgsUGzWp4zK3DEH10q9TJ+n2JQeXKPGht6gaV
	nV9yyx/wVHUd6bxle3ZoK8vUjnyXrvOOEnt1o=
X-Received: by 2002:ac8:5d0b:0:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50ba38f12ebmr60178651cf.37.1774654124631;
        Fri, 27 Mar 2026 16:28:44 -0700 (PDT)
X-Received: by 2002:ac8:5d0b:0:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50ba38f12ebmr60178431cf.37.1774654124132;
        Fri, 27 Mar 2026 16:28:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:28:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v10 00/11] media: qcom: iris: rework platform data handling
Date: Sat, 28 Mar 2026 01:28:35 +0200
Message-Id: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQSx2kC/4XQ3WrjMBAF4FcJuq5aSTP689W+x9ILSZY2gjhOL
 cdtKXn3yk6hhrXJjWAE5xvmfJEShxwLaQ5fZIhTLrk/14GzpwMJR3f+F2lu6wcRTCgmhKZ5yIV
 eTm5M/dDR1o2OBhkMiwZb7jSpwcsQU/5Y1L+v93mIb9eKj/dP4l2JNPRdl8fmcI4f40vnyhgHs
 l7bHJalHPh96RTP10KrTEtnhGQ0WTBR2KjR6maS/4cl59z+5BYinfKFlvc8hiNtpXWQfFAO/Wa
 6rubsnrv690CZSgqD98BdbCYk82nHXMZ++Fz6m/hy209TZqupiVNGgwgSJNhk0fzpS3l+u7rTX
 MZzfRZ1Eo8lUSUXEgPlIBgMOxL8SsD5pgRVSnWPNAFbjO2OhGsJNiWsEkcrdJvQMrUnyceSnCX
 D0KBLWK0dST2W1CxpBd4b0KkVO5JeS2pT0nNPQdvEGCTJ9xo3a8luSqZKUjorlYo+qb3r7EoSb
 FOyVQIL1iqdUMut62632zdvED555wMAAA==
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8300;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3MLAIq+HiE/22OmCF0hxluJv1C7cQ32vE816B4yopFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKn63+Rpb/O/P8Hy88ScuuzXPNOsqoKvcZnp
 z5NsyR7+gCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSpwAKCRCLPIo+Aiko
 1Xj1B/9UUNkePq17BT33fXCh3g0zdHp8MN5SUdZl6u+ItFazuUZGXOX32mHknOsApiYy04srh0+
 GNfwX6ekbacIq0e0cve3fYjrQwJMnIFvleK5iXgvtQ6EVk/2Kd4AJVDwF6U9DKR5dgLoKc05AEH
 0Hfz4kavR3XAqKtH0ASug4veTN4Fm4CdWrY7XKozqC0UlxMRktZV19/9igMm/rlYBoG22qSgWUy
 p6qgxdCCPh0sn0oj9BDDIycnHJarj+yGKwbWWDmuOhZ0bT/JRh7gFct947NPHJsSHwViece7cbi
 7j08PWgdBckmppWcD97FcIgWszqq5YGZxofP6n67P7U2FIZj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfX3v6IEKhgpBN7
 nnM+Uzedcwbl78XqhOBp9pzDya1i3PrWBkIqrU4hbNzzYRiRRsBeL+OLHfDSry1digq7YXKNrPl
 rKf5J4MsGVLbKZHOgrRKkVM+cNugE/5xDDRdJ51f7dg2kTyvCQlbXoY5BlgaLhNXm8DSJe+XeYl
 sMj+FOVLwoxp0D4EbNvTdyOdAr2/LgoKJIVn0JqYpaFAbleF+nPgUQZAgI8u+zytAKqMm3iCP1G
 iRUWAPrMGGww0mmg6lldbXCNxWhoFkBmn+UGzblkavyx6Eji/NwNBBpSSJlqG3ZB0xpxQ9aF/II
 IHK36PBgAgKcqRhHfQeGSFFhe9HCu1q5yjfs2RcN8L0qmNKvFj8XR+TJe7NU0ZCH6xOQuEOMo2o
 d938mDEOMt/sPIu1aZfATEw/aVNPd+L2SdWM915QKRRiwKGK9Wa/UhUKNp/Io0Dazj30H5o0iME
 TwzfWQvaKPAnJH6fRog==
X-Proofpoint-GUID: y3LiuezdglNMIUaaf59C8I_CeUADiqPH
X-Authority-Analysis: v=2.4 cv=M7RA6iws c=1 sm=1 tr=0 ts=69c712ae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HAAJ_PAJ5jvC-A5sbgwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: y3LiuezdglNMIUaaf59C8I_CeUADiqPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57389-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 219C634C4AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently platform data for the iris devices contain a mixture of
hadware and software description. This seems to work in simple cases,
but as the driver matures, it leads to strange decisions.

For example, the recent series extending SC7280 support to be able to
use HFI Gen2 firmware ended up duplicating SC7280 data, using
SM8550-related structs even though the hardware hasn't changed.

Another example, SM8450 and SM8350 are also simiar cores (and similar to
the existing SM8250), however SM8450 will have to go to the same file as
VPU3 cores just because of the firmware interface.

Last, but not least, this leads to a lot of copy-paste duplicates
between platforms, having similar firmware interfaces. It damages
readability and complicates adding support for new platforms.

Rework Iris platform data, splitting it into hardware description
(definied by the GPU core) and HFI Gen-related firmware data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v10:
- Rebase on linux-next and fix dependencies version to the latest
  revision
- No source-level changes
- Link to v9: https://lore.kernel.org/r/20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com

Changes in v9:
- Collected missing R-Bs from the previous iterations (sorry, Vikash)
- Link to v8: https://lore.kernel.org/r/20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com

Changes in v8:
- Moved core_arch to iris_firmware_data (Dikshita)
- Made HW_RESPONSE_TIMEOUT_VALUE static (Vikash)
- Changed firmware name for SM8250
- Extracted firmware description interface (Dikshita)
- Link to v7: https://lore.kernel.org/r/20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com

Changes in v7:
- Fixed build error
- Link to v6: https://lore.kernel.org/r/20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com

Changes in v6:
- Moved get_vpu_buffer_size() back to iris_platform_data, it will be
  handled separately, when adding support for Gen2 on Kodiak (Dikshita)
- Renamed iris_platform_vpu3.c to iris_platform_vpu3x.c (Dikshita)
- Renamed generic VPU2 and VPU3x constants to stop referencing SM8250
  and SM8550 (Dikshita)
- Link to v5: https://lore.kernel.org/r/20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com

Changes in v5:
- Added missing kerneldoc for struct iris_core (Dikshita)
- Dropped two more unused defines, leftovers from the split
- Link to v4: https://lore.kernel.org/r/20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com

Changes in v4:
- Renamed iris_hfi_gen1_ops instances and related functions to contain
  _sys_ (Dikshita)
- Link to v3: https://lore.kernel.org/r/20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com

Changes in v3:
- Dropped the config_params / subscription_params patches for now,
  let's get more different platforms in first, determining the common
  base and the best way to handle the differences.
- Dropped set_preset_registers callback, call
  iris_vpu_set_preset_registers() directly (Dikshita)
- Renamed HFI ops to hfi_sys_ops and hfi_session_ops (Dikshita)
- Dropped (unused) hfi_response_ops from struct iris_core (Dikshita)
- Renamed hfi_response_handler and get_instance callbacks to follow
  other hfi_sys_ops callbacks.
- Link to v2: https://lore.kernel.org/r/20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com

Changes in v2:
- Fixed build error in the interim patch, the fix sneaked to the wrong
  patch in rebases.
- Link to v1: https://lore.kernel.org/r/20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: use common set_preset_registers function
      media: qcom: iris: don't use function indirection in gen2-specific code
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_sys_ops
      media: qcom: iris: drop hw_response_timeout_val from platform data
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data
      media: qcom: iris: use new firmware name for SM8250
      media: qcom: iris: extract firmware description data

 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  88 ++---
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.c       |   3 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   9 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 +--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  13 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 168 +--------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  43 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 413 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 115 +++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  95 +++--
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 132 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 219 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   5 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |   5 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  11 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 31 files changed, 703 insertions(+), 828 deletions(-)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260227-iris-platform-data-c5c80e84d1a7
prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v5
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5

Best regards,
--  
With best wishes
Dmitry


