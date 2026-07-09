Return-Path: <linux-media+bounces-67179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zYVdNPynT2pplwIAu9opvQ
	(envelope-from <linux-media+bounces-67179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:54:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3EF731D0B
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:54:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FWxBYymy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S6grsNXF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67179-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67179-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A11E3025E4D
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D633750DC;
	Thu,  9 Jul 2026 13:42:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CE736F429
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604565; cv=none; b=tpu684DO6eoDXHnPh2kCq8z+UcUbFP+rf/GWpdFWkWMPjQiPvT8CiIyvNF9A3wx1KEzKomEaOM7RzhwMEmRhYL9DSZI02/srYzM5D2tle3EuKuR3dXaoI8AK7gZHoLBbEtLPj3hana1B2WKAC72gcWiOO1mLUMTAajX+UKBNZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604565; c=relaxed/simple;
	bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQP5WyFcuKtn4L8dab9yhx/Ix36WdLFR7K5qN5QzX9J0g8ZsrDlEVNDi8X50qDiIjfOLpHX9D3QX79BQZm959GGs7HAfuaxSi12m9ZhV9it3atPzec5/Gdf6U0uvfM/QZXRl7/IAm8uUuUhexDTxWwwyui45sbv9jJTB4+4j/JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWxBYymy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S6grsNXF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN1TX1656983
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=; b=FWxBYymy3HMALBJR
	aYPvUURuekqh1leJ+SZLvJefacgkveb+++g/b5f98UgR+GTPAF47/OojiMcGM/2C
	aHNf+UJE5f+v7Yq92g+lZ6mSasS7oUEwG1ZK57RpIIJJygtoGt3OXF/ko31t+9qB
	Zt0zl/ML655UEC9Bh2d+n3y1W/CcFc5CDbW+gDJieltjZ8LO3dgcX5Suxurm7dEi
	F+dZ6eYa/165j9maVKyXr7l7VbUKlSSte9M1kORjCRrehtO9BdzGF2AZqSTPn0Ss
	Q8omxU82HKMZcRvM3nY78WLrZCbBIiLo4RmmFakfsVLpvJ+x+8uBWTcaQsDIxLj0
	qjofkQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3suwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:43 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-967973f71fcso401177241.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604562; x=1784209362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=S6grsNXFUwwBIzZRoChGbx9NY6kRXdU4Dc4IxXSccMnyLznITJJCUNDpi9+JoXZwAc
         SblfDG8RqC7nNEWedy/AkzK1Uq4zxb9h26FxfUJITulg5vKWBRwJpXfMzlHMISTtLTdM
         qfvmXuOMYQbIWa1vC072Zc/nOEgiWL/zha+wqWsbuSHsfcCbOQLVbSyvDiaHgzVwLo/5
         jco19kOMPWmZmiQ7iNFclakZAadJ9owYnUiZPz7b9j/n12CBcS3U9q90wG4F1pA5/iL6
         sVV+cw2KBv+aNMziW3Q7f1y8hpy+lR9vrTTCGzSv7flZBOc8RYlwXjClYPT78YhQLV9T
         uuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604562; x=1784209362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=ITvc8xiN1sxivKc4Wf1kFmT2UjUYOqyIh4nwMTD9AO8kMMAO7SPFd1oAIHlNGfhpfy
         MjrxG6qLIMRmjvCNz0SwZUBFqgoBCWGGrdF/Rb7UPUYJCebYMiEuWQpsdmsPv82R0jhl
         u82DcBGwdgwndNRREcrR/DMDHdpIhVn1IsvFHvVnQkF6n2kHvIFW8+ySs8NyM6rKDY50
         tRZ2BYP7k/BY8xkyrSFrmTIZMzD6Y7T815aMEB0MMKwyVEXor0IniDyly2uGDbK+l3UM
         UItkOOUx0/cCSNNEJLaW5EladwyAS6YOPTDWU/oGyoNZbqSkeIvxtv7XGOzg0JPbT1CY
         GflQ==
X-Gm-Message-State: AOJu0YxXYs4LumrB5JxKtGowEwD3qnqRTlW/qfyt6USOwxNZuuLCs3nC
	T2oLnZXgXjA1rf256zUZMoLH7K/eMnDJM8AthVcO+20PoZjFQcdC62yoeAzfw2sDP0vASKjGzC6
	XRh4bJ148d62NH7OCEgQg4kfmwymWesg/VqFgUHNSirdT+KDbyFQVWN9bQ2uD29OtoA==
X-Gm-Gg: AfdE7ck2fu1tc1P2RmSkqW8muhk0AnQ1DhqucPNnFLZeVuzWwV/DC/6Ak8/w0EJLWtx
	l9h3QW9gQE8x2HlMXX4i/Jxd2m7dTXGLWggpMf8sM54vTw7VDdaIDEy5Ii1WYCFa3NT635wKucP
	0nBD8rhgrDeFBJn0eAft9QpVMYXaFkKrjhVSrQiucsy/y8W1a6gg1Rv2M51cAYDnY+f3rfedwkU
	LWwD/YsauykF/BU/1PJbCqoeArdXQyPIVDn+vWI3B4OLVIGC/hTO4onyyotNYaom1q15JwYr4vy
	jObVlvDyb0QR22oxE/8xQGk5YM1dtIhfIy+zp0Rb1H1Zw/XRM29nyBDE9ZVmI8Wnhp/u4YmUrXt
	rea8rEmquBNQ2Zk5as3bc72x350w+ZvKaY0mc+2JR0FawpKAefGjlF1ZrFWUmv2p6jcezzRlsZU
	wE1cMgFcRcn32SosUIu7GP0Z7t
X-Received: by 2002:a05:6102:94c:b0:660:d26b:506e with SMTP id ada2fe7eead31-744dff52b67mr4460035137.1.1783604562373;
        Thu, 09 Jul 2026 06:42:42 -0700 (PDT)
X-Received: by 2002:a05:6102:94c:b0:660:d26b:506e with SMTP id ada2fe7eead31-744dff52b67mr4460000137.1.1783604561868;
        Thu, 09 Jul 2026 06:42:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:08 +0300
Subject: [PATCH v7 17/18] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-17-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6Um3x0DVIhta7pt6Su24PLZGGj05AXnS/cbv
 /uOXE/dWFyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJgAKCRCLPIo+Aiko
 1UeAB/9I1h9kcsc0rZFPxQVvV9c5C5XdymJruOglX7gtc6BJIQcL0iuuybsm28TCQmtxTbbUd62
 d7bRpjC7LV/bH0i6KHWNpuAcoZPnnnRRg7rsKDRtPb83/B54rJ2WVdyYCXj4pyjHRAQ349TLoin
 hUcLx8C39cmP1dFS5QPTVszxyCOAoU3e4WSBbJG2MpeBl2bUl+HgSLWMGmMz2s8nfTH2iUGgJ6k
 NaOoMadqVt8oxxCOQaOxA+V9f+K+qjSD7YQwTFK4yzy8Vb8bagG626Uz0LfvtLxwYWZBNWpI1yg
 ncBrcfoM7BhRYdddCJ70dFbBUXLzFpjD6uyp/b55HeDsP5SN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HkKyWmWelkzxinXqlpic6EEsKQvQY4_0
X-Proofpoint-GUID: HkKyWmWelkzxinXqlpic6EEsKQvQY4_0
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fa553 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4ldMYZ-nzf-nUnInMJoA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX5vfOLomkS/4Q
 dhcNYqPELECoMxrbAaiufG6eIKbh6l8tzV4OaaHYQTwl6FZXoC9X32NNi4iaXs/xIq2Mk5hxZlX
 hdCRfIRuo3BwASLeNhM9lf5ce4W7axU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX9/5aHm5iOCNr
 TokY4fZQw2qHg/CDHXV5+NsNerxOPacE5fCs9IWg4FuEUHLoG+M8QILNWK359UUQiW+9ZGuRhgI
 5BJff0VSqtalLP80XeLDAa7Ud+ZCpxI45e+Q3b0HuR9bEEPxAxHZB6R3OCyHUEYD7G11mGdJ7Q7
 BozlSfyVKhbLV7BsLnY7ap23FHb9fk4DvANL6f3iDEDaPWwxy1tr90lqphn+V5YOccXWAuDi/2k
 LBvGJyuV3ZEA/qQyyrdnGerRwe9GH/oVy6zko/2ewdd+CDeOfWSfzqI2LU7eEUw2URiS+kuLSFO
 9KPoh8rqHvbGMcp/jdWpceSmpkrqsl1hrZ1AgDz+3z2swjM6r3B1R40OffcDzPTaHFfvkHFs1XC
 wI1PziJZqQnyhO8HoRgwwYgbFyyNjWlcWs4YbcCtlcbY6XapDXmljo5foQmFHV1GNZKDEEYR7VK
 V+bFRxh5giYO/vl5JJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67179-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D3EF731D0B

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


