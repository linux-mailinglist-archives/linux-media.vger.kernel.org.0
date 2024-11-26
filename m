Return-Path: <linux-media+bounces-22075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 863DB9D9507
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 11:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 291EE165E23
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 10:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A021BC063;
	Tue, 26 Nov 2024 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YCWzKZc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863AA18052;
	Tue, 26 Nov 2024 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732615317; cv=none; b=i3iQAv2wuBvLNh8AG/f9QCwgupnjt09vOnN9WPKWATL/XS17yXDCRkDGeXUm69b2vg1Kr6E0+JDMlsZ31pJS06lFqEG9jINbzcN0dkwOnswZabpyORpC43L5xE4HNm1xDn9gtKMTPVJSEnOjUCZbuB8HYe0DCi/OpC8NYP+dSO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732615317; c=relaxed/simple;
	bh=4Jb0ttyJsI1EWBp+8DC3RHDoQ0nIAAZKrCWsBCsVcs0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ms0YZcyFKVU6cioFxtHRMruQfWVqMj1hn1HE066WGbetqITRI9heT8CoVOkm2Nmqk5tbX5sEGLijjLAip73gfrXfIAudWDJ6bRuZ8jQtksCwqMZoy2Byj1ltqz+Kb/OcdRsWa3C1+o+2GfoMm/rOVqdlpIMABKPW23Tk7TLc+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YCWzKZc6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APLwvFk018283;
	Tue, 26 Nov 2024 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RPD/df3gmCnndHiCN5R9rY
	ucR7QClZhtnjHTvVNgpA8=; b=YCWzKZc6G5+VQl7ETCs7FXEGn8v4iY2GFn/vKG
	pft0kgFIgPN4k6MH5YpSrhkwbtXX46YAUiCHJDlzEdwqo6H0yPMy4EAk+9KGiMWZ
	obykTsOEP09OH+0ZcU4TDDB3R5wMF8o8xiDWmy9ZFJbcnTCgk0ybpkusKUGFIo85
	PIVnj4KIHs054Zr2qnc+Q4/HUPnoHMFwRkPWsC0Zv2I7xGn8oDobgIfo2fJh3amh
	fqYO+ynlaa9b72oUIzOMvKI8FzN0uKtF5RyoPHT8EsnQfvJ/XBgSWr1n3bLTZZHT
	rnO1JjX28YIk0D/iyYXntxxRKqyg9ww+lk2vcOgtY8GGlmGA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336cfqr1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 10:01:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQA1nkd006536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 10:01:49 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 02:01:43 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v4 0/2] media: qcom: camss: Re-structure camss_link_entities 
Date: Tue, 26 Nov 2024 15:31:24 +0530
Message-ID: <20241126100126.2743795-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9OABl63SUQxaIJwvqB2QgUfWS8UdKnjU
X-Proofpoint-ORIG-GUID: 9OABl63SUQxaIJwvqB2QgUfWS8UdKnjU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=860 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411260079

Refactor the camss_link_entities function by breaking it down into
three distinct functions. Each function will handle the linking of
a specific entity separately.
SC7280 and later targets mandates for 1:1 linking for csid -> vfe.
i.e. csid0 can be mapped to vfe0 only.

Changes in V4:
- removed null check from camss_link_err.
- Link to v3: https://lore.kernel.org/lkml/20241125103457.1970608-3-quic_vikramsa@quicinc.com/

Changes in V3:
- Broke down the change in 2 patches. first one to functionally
decompose link error message. second to restrcture the link
function.
- Removed the declarion of camss_link_error from header file.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20241112133846.2397017-1-quic_vikramsa@quicinc.com/

Changes in V2:
- Declared variables in reverse christmas tree order.
- Functionally decomposed link error message.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241111173845.1773553-1-quic_vikramsa@quicinc.com/ 

  To: Robert Foss <rfoss@kernel.org>
  To: Todor Tomov <todor.too@gmail.com>
  To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Cc: linux-media@vger.kernel.org
  Cc: linux-kernel@vger.kernel.org

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Vikram Sharma (2):
  media: qcom: camss: reducing the repitious error message string
  media: qcom: camss: Restructure camss_link_entities

 drivers/media/platform/qcom/camss/camss.c | 193 ++++++++++++++--------
 1 file changed, 128 insertions(+), 65 deletions(-)

-- 
2.25.1


