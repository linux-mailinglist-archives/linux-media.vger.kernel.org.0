Return-Path: <linux-media+bounces-67209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jvz7E4z5T2qCrQIAu9opvQ
	(envelope-from <linux-media+bounces-67209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:42:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C787351C3
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:42:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ER+nhUjl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MZqkvYoH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67209-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67209-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B826A30BEF07
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 19:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B37D3CF042;
	Thu,  9 Jul 2026 19:37:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12233C98A2
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 19:37:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625840; cv=none; b=Ecj75vozvrjNlspNXzzqr7Z0Hiyi12l6+2yMXG9lT2znVFg657BVFNGjE7/ZmC5IWClkVz5g5zo5/QhNKA6p+lN1O5/MNKUoyXf0JQhWq91Ft2Z69cXpMBs26nrmPxGHjt0f9T+sn3jpXChVk6PjXb1W0vMuAQckQoHoy/MUhco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625840; c=relaxed/simple;
	bh=ApbC40tJ27UQispiaWx7l8/PqpwgidGsxfrbIX5Rw3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Db20TSAlaBpLjqBTDDG29Vspy5pgfSikazZVyv6hdfTMMM0Bbqt/jG3CJkQO9hKfuHw9gvKFSIiMHA55oCdi11BbEMYduj0JgloXjGjpUGYMquN+70KVxqLYEFgt4TTfwO7aohqvuffnrmFnHlTJJrk4gnyv3ijCHIDroRYluus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ER+nhUjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZqkvYoH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXf8P2473906
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 19:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLlmQS3eajT2FPwUO5zF0ic4Y+7UjqDurjwoCr/DV2Q=; b=ER+nhUjll4PIQv+3
	S9bRhzAAGxlF6OVVhuPPgEoRJgcCgMT3zKhlZ46XoTeFj0TsNJDwjAytJ3ImjmYr
	nhmdR8ach+Y5z8dGRn9W605+xb7IMKOR7lGYGpeD8Hgom4dgIO/yEwS5VY8O7lxS
	pL5dOB0IOF+Vt/wKD1jDM3wu3JUDTc0+cNOdK8cIe7jaLQAweR1flMLnmWMeJtba
	+GNQreeF7knkOqCM5/GyE2H1pIUSL9MiE2iFlQe9il/ipxlmHYmAcHtD8TUgaxLb
	YudfKJG6ahA3HIVelp/QyD0SjAQHecox1EO3nIx7Tvwqcos4lcauquEyjkOHnMku
	rfiwUw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqphq5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:37:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9674d6a4ca4so149756241.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625837; x=1784230637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLlmQS3eajT2FPwUO5zF0ic4Y+7UjqDurjwoCr/DV2Q=;
        b=MZqkvYoHrzEFo1/f+nchQ3IiXSgNGpQy+Iia644RssM8RHvITRriF8hJG47Im/Adc3
         p1aibDtgckmuLIBKJ5X3GyqIyjmgQ4//B7eyTagUO1VGNumgrCUpLl+UX0gBj9K1/53r
         BQTV1XylAUCb0/j0IXkMkrkc9Oj4UrMepqnC3z2oFhlsFi+T5iBMEtPn/N9DiBa9kR+g
         j3F9UDr3gqT2NzwVCtkoQmu5mRchLwXToBiNJObRiolduJF9gy5ALgGVU3czPcdR+4S5
         X3WgzZdPI/gZPAV+2aIEQtZFKOrSQ9YBEo7pBHWCNvGZhe6KU13ndkijRAhquvsdPiCA
         E/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625837; x=1784230637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLlmQS3eajT2FPwUO5zF0ic4Y+7UjqDurjwoCr/DV2Q=;
        b=ZkNg8U4LdRTC+92SSDjkHh35fSIC0rLepSe1qd437nzLWvw5AUwmLA19eINV62wehm
         JfRJAKNc0kYi8Pz54Gv4EIGzyIJOEJg+IdlARqLNdUUPVv/vDL3v5MCWm8tQ6yOgzNUI
         EDlNkkJ4Z8dcoq37E0zIu96usP4rApsmniAM9R42Z8C6mZtiFMU/62AjKe/Zx9YZZ20K
         lWiS7jC8uI6FOwUKLv1CLFa7XqEI5POEYj6X+o5yVgzVtHN/GDA521X9d0Tmk3U8amhB
         z/IRP9I7i8zwdYG78KhSGPUu33kKkrwtXku77ikkeTHg2CFxZSzC2nr45vD81mnNcEtz
         BoDg==
X-Gm-Message-State: AOJu0YwpH9P5gzg8PYF4mAYuTAjoUkgL9ag3+bw4MXXbfAKEpmsc9bV4
	4uzkoJZ+tlWws06SxOV5SHo6FGRsuzMPr+ds3isx89hu7Rto64HcxVdR9sXonJLlHQ3khSwrJe4
	MlPDNMYDB11GtIW/kO94Xx4fjC2fCKh3UOLTnLop8nzjEGY/xxqb8ridrIM3zBqaUFA==
X-Gm-Gg: AfdE7cnP9KSxG34qCwT203L+ZJjieskPU1qySFfIrrmfdFzevTBUKBNJGrMW8zcb5/B
	DYigIp9ELlGQuxzxUf8Chn2LXAl6GIfxJzUB6L6Nr/w4QjnbRxjjpoChdjJojOFBwxwMhyB1fOh
	Y9ijh/nS250U7nLXoYCTMdovFIfzypg/v4ktZMz9346/or80WUIZP1tMw7PAw0UB+pIRgd/6kKI
	ogXFjZHl5zqXN8K8/sULSK2fDFG+0EFGErfnPIeQEWjPESjAnZ2mcgKmxqzmO5gL9nIgWu8UZLg
	FnlMLbRRlgJg9SPewjvZdV6TLwgiz4zXNjx5E2EswJZb98lfqNdnHyjZaChPqgAGkZZQE5/WZrd
	qg4bwiGxkxuvW1DXoyzhF9qJWC2dL+fSIBoiN/vX3NMnWbwKJe4mFFVJaLvYFR3VUs5qCL8HoqL
	qhOCb/mKFm9tVjK9sAgOPQ1lFS
X-Received: by 2002:a05:6102:5cc1:b0:733:844f:3582 with SMTP id ada2fe7eead31-744e03b1d42mr5006570137.27.1783625837328;
        Thu, 09 Jul 2026 12:37:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc1:b0:733:844f:3582 with SMTP id ada2fe7eead31-744e03b1d42mr5006550137.27.1783625836820;
        Thu, 09 Jul 2026 12:37:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:04 +0300
Subject: [PATCH 7/9] media: iris: add MPEG2 decode support on Gen1 firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-7-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9434;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ApbC40tJ27UQispiaWx7l8/PqpwgidGsxfrbIX5Rw3A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hdB4+1QVbCBdM1XGAz/KEJ7GAjGZwy7IFKr
 ayNo5rzce+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XQAKCRCLPIo+Aiko
 1U8eB/464hcGitk89F/xcBgFcrKW21KFndHRZUkh4n/3orjOw3OLza2K5PIoTRXhi0NXktuOcF4
 8iNramYgU+p13iPmbZrxCf+PsUjtL98Qmi/oEKdOV7CsGv30uFOQaPHs+5/nGGaTzIsze9RVhTy
 mpXcsSbXj0RR2NgukMuy6cgEQKMkRkAgsdCFcF5CqRPYO6rJe5pEDWRyUivoTKSsXEPqf2DXaTc
 lVpD0rKO+U+DkmBJ63ITOI+IVJiCzswfaLedTOQiVUa4TzH65J88PZhjlGTgcAc4tHftrLOm0mw
 YMJ8g6mTgL5cmrA+hbA3qoikASQT0fpEz3ccnha1fompnx7T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX5JVYffhtSMks
 wJY9uSpXGe0VaZayMPKuBzSDGYUG8pCqKD7fXY6O37TmvlCqmoKL3kWFhbBYU2IUBds8Z31GWLA
 0aRVyOtMyKjudGR3znShpQMJQ9TjB1Xv0TlELnMGzj3pXypPCC9qGcA98ml5BGdjfBuQWhlguok
 fZsl/wvh45HjEdXmGrECfJccelIfXFc/+utkqWYum2Zp9fvJhIh5FwKrCYzLzweBnqgq5CD6A3p
 kCyvtCXCyxKhmOKlQVQdUot+A2pcS0u8J12mrAxVsZINp9Dq/aeappt7bZdzkyhMhxa7qQlEesF
 TKAN67DDJ9us2gpcP1a+gzsEh2sj9JT8r28e9NMTSQhxF7r6rqF+p5h5Cfxltc0EJal0OrbBbri
 L1vyEoeABbXTwfgp5AiMg3FiOld10bxWyUZ0LcE8h0OoykB02P1seWMivigjoXu5kpQ4H2tpvZQ
 cKttDxcUKcBwI6ds6ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfXzDf8C8/zUXQ+
 N+f7WSdJ8+E3JnzpnjalGX+9vr4xlROsxki/wX4W0+cRb9uCO/kEEd4zPQnT9cdPcaouTUAkV6A
 6CxyDJYFg1Wr+gIrBLdVhzaU+Id8/Cs=
X-Proofpoint-GUID: 3wBtmWZ0VXXJI7JFjzl2O-orPpu9ddgd
X-Proofpoint-ORIG-GUID: 3wBtmWZ0VXXJI7JFjzl2O-orPpu9ddgd
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4ff86d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lOmhsS4CxkcBO-nfWVgA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67209-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97C787351C3

The Gen1 firmware supports decoding MPEG2, but the iris driver never
advertised or wired up the codec.

Add the MPEG2 HFI codec code, map V4L2_PIX_FMT_MPEG2 to it in the Gen1
session open path, and compute the MPEG2 internal buffer sizes (line
buffer and the quantisation-matrix / QP-dump persist buffer). Advertise
the codec through the new Gen1 decode format list and register the MPEG2
profile and level menu controls so userspace can query them.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 15 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 24 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  3 +++
 7 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 1bd6460a1b0a..8f9347c1df2b 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -30,12 +30,16 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return PROFILE_VP9;
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
 		return PROFILE_VP8;
+	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
+		return PROFILE_MPEG2;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 		return LEVEL_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
 		return LEVEL_HEVC;
 	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
 		return LEVEL_VP9;
+	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
+		return LEVEL_MPEG2;
 	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
 		return TIER;
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
@@ -175,12 +179,16 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_VP9_PROFILE;
 	case PROFILE_VP8:
 		return V4L2_CID_MPEG_VIDEO_VP8_PROFILE;
+	case PROFILE_MPEG2:
+		return V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE;
 	case LEVEL_H264:
 		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
 	case LEVEL_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_LEVEL;
 	case LEVEL_VP9:
 		return V4L2_CID_MPEG_VIDEO_VP9_LEVEL;
+	case LEVEL_MPEG2:
+		return V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL;
 	case TIER:
 		return V4L2_CID_MPEG_VIDEO_HEVC_TIER;
 	case HEADER_MODE:
@@ -527,6 +535,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 		 * content also uses a single stage.
 		 */
 		if (inst->is_interlaced ||
+		    inst->codec == V4L2_PIX_FMT_MPEG2 ||
 		    iris_res_is_less_than(width, height, 1280, 720))
 			work_mode = STAGE_1;
 	}
@@ -565,6 +574,9 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 	} else if (inst->codec == V4L2_PIX_FMT_VP8) {
 		hfi_id = inst->fw_caps[PROFILE_VP8].hfi_id;
 		hfi_value = inst->fw_caps[PROFILE_VP8].value;
+	} else if (inst->codec == V4L2_PIX_FMT_MPEG2) {
+		hfi_id = inst->fw_caps[PROFILE_MPEG2].hfi_id;
+		hfi_value = inst->fw_caps[PROFILE_MPEG2].value;
 	} else {
 		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
 		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
@@ -585,6 +597,9 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 	if (inst->codec == V4L2_PIX_FMT_H264) {
 		hfi_id = inst->fw_caps[LEVEL_H264].hfi_id;
 		hfi_value = inst->fw_caps[LEVEL_H264].value;
+	} else if (inst->codec == V4L2_PIX_FMT_MPEG2) {
+		hfi_id = inst->fw_caps[LEVEL_MPEG2].hfi_id;
+		hfi_value = inst->fw_caps[LEVEL_MPEG2].value;
 	} else {
 		hfi_id = inst->fw_caps[LEVEL_HEVC].hfi_id;
 		hfi_value = inst->fw_caps[LEVEL_HEVC].value;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 4c3aa5a03ddd..4b05c2a47b0b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -41,6 +41,29 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 		.value = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
 		.flags = CAP_FLAG_MENU,
 	},
+	{
+		.cap_id = PROFILE_MPEG2,
+		.min = V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE,
+		.max = V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE) |
+				BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_SNR_SCALABLE) |
+				BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_SPATIALLY_SCALABLE) |
+				BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH),
+		.value = V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN,
+		.flags = CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = LEVEL_MPEG2,
+		.min = V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW,
+		.max = V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW) |
+				BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH_1440) |
+				BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH),
+		.value = V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN,
+		.flags = CAP_FLAG_MENU,
+	},
 };
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
@@ -435,6 +458,7 @@ static const u32 iris_hfi_gen1_dec_fmts[] = {
 	V4L2_PIX_FMT_HEVC,
 	V4L2_PIX_FMT_VP9,
 	V4L2_PIX_FMT_VP8,
+	V4L2_PIX_FMT_MPEG2,
 };
 
 static const u32 iris_hfi_gen1_ar50lt_dec_fmts[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 90645ed3e0d8..53ba48f88410 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -111,6 +111,9 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
 	case V4L2_PIX_FMT_VP9:
 		codec = HFI_VIDEO_CODEC_VP9;
 		break;
+	case V4L2_PIX_FMT_MPEG2:
+		codec = HFI_VIDEO_CODEC_MPEG2;
+		break;
 	}
 
 	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 13c8ff59d6e4..3c8ae1c82540 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -14,6 +14,7 @@
 #define HFI_SESSION_TYPE_DEC				2
 
 #define HFI_VIDEO_CODEC_H264				0x00000002
+#define HFI_VIDEO_CODEC_MPEG2				0x00000010
 #define HFI_VIDEO_CODEC_VP8				0x00001000
 #define HFI_VIDEO_CODEC_HEVC				0x00002000
 #define HFI_VIDEO_CODEC_VP9				0x00004000
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 84017b66e98f..3d631effe307 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -116,9 +116,11 @@ enum platform_inst_fw_cap_type {
 	PROFILE_HEVC,
 	PROFILE_VP9,
 	PROFILE_VP8,
+	PROFILE_MPEG2,
 	LEVEL_H264,
 	LEVEL_HEVC,
 	LEVEL_VP9,
+	LEVEL_MPEG2,
 	PROFILE_AV1,
 	LEVEL_AV1,
 	TIER_AV1,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index ca90414e6c19..c16e2b652cf4 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -298,6 +298,11 @@ static u32 hfi_buffer_persist_vp8d(void)
 	return ALIGN(VP8_NUM_PROBABILITY_TABLE_BUF * VP8_PROB_TABLE_SIZE, DMA_ALIGNMENT);
 }
 
+static u32 hfi_buffer_persist_mpeg2d(void)
+{
+	return QMATRIX_SIZE + MP2D_QPDUMP_SIZE;
+}
+
 static u32 hfi_buffer_persist_vp9d_ar50lt(void)
 {
 	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
@@ -1083,6 +1088,8 @@ static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
 		return hfi_buffer_persist_vp9d();
 	else if (inst->codec == V4L2_PIX_FMT_VP8)
 		return hfi_buffer_persist_vp8d();
+	else if (inst->codec == V4L2_PIX_FMT_MPEG2)
+		return hfi_buffer_persist_mpeg2d();
 	else if (inst->codec == V4L2_PIX_FMT_AV1) {
 		caps = inst->core->iris_platform_data->inst_caps;
 		if (inst->fw_caps[DRAP].value)
@@ -1163,7 +1170,7 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_line_vp9d(width, height, out_min_count, is_opb,
 			num_vpp_pipes);
-	else if (inst->codec == V4L2_PIX_FMT_VP8)
+	else if (inst->codec == V4L2_PIX_FMT_VP8 || inst->codec == V4L2_PIX_FMT_MPEG2)
 		return hfi_buffer_line_vp8d(width, height, is_opb, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_AV1)
 		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 684b459c0cad..4694467677f6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -69,6 +69,9 @@ struct iris_inst;
 #define VP8_NUM_PROBABILITY_TABLE_BUF (5 + 1)
 #define VP8_PROB_TABLE_SIZE (3840)
 
+#define QMATRIX_SIZE (sizeof(u32) * 128 + 256)
+#define MP2D_QPDUMP_SIZE (115200)
+
 #define SIZE_SEI_USERDATA			4096
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1

-- 
2.47.3


