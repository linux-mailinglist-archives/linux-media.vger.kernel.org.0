Return-Path: <linux-media+bounces-49450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B45ACDB7D9
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 07:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDAF1308DC11
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 06:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25DA329E5F;
	Wed, 24 Dec 2025 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="If5K/Bj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vk1dP4SI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB4320A04
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557681; cv=none; b=J0yq9LkZ5SrNY5F5nWF/UnAjhvC7R/OrOjWLMz0xOaG1wuQQKQ9S6ABPNPqdaVdBfgc1gwEx/hQXsAN2fpn5WlRrP/2owgZ1lfxPBOiAtBssAFPQI+1O38QjPgviGqZ3M1QaRkyHI4gOAJFHmWc4urrTIvzYCAYi2FZRbwU34aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557681; c=relaxed/simple;
	bh=LQBwQ5KKiAURRSdH9SPmpV/8R5KpoEVoxpc1FUT4Bqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqZqeneciGYzax8Y5WbwHHwSjo3ZNmMgPm2qZvqrTH0crL11CNF3yUMcY10qaTX4GW1U84PlePR9BLWQbfiLcqlPIv620FZaK/lH0nxYlhJiGeGdkWt6gW67q8UzetguQZcij3WoU7M2j2azHmLHBR3pW0eXToJM5pfLwneVL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=If5K/Bj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vk1dP4SI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO61f3c678252
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+l/KNumtMTGWNi4cIdCRyGHVnnCi7mJh+TTQ304qCI=; b=If5K/Bj3zQdKfonB
	1P/HzoOt3wJXo77Lyt0X+p1W2UEspwrDI00B16J8JD0u9RaIzoNcTevQXUVaZM8z
	xv6Zi2bqeIRSzMY+O+uZ0VeZ3RYQRJ6yH+TeXN4aD5LLhsRn1sV+xPge84VpWV/N
	xUw8sUPoSESQr21SysouBHUj7EgP5XOnidYUpaUZGrK8DbNztKx0A1OdjqwRv/TJ
	xL+dn48loaHQPm6zetiyDvDmlB8AymMITG1vvKkLxxrQ47h1ApUSnSRJEYKNglYb
	FD5n4+4Sj28rGkshyG7+tgo+Iz4Jw7xnmf1D1MdYBekXN0pwdwcKL/quz+yxHOg1
	biS+mg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq1rnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:27:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7bf5cdef41dso9745827b3a.0
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 22:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557678; x=1767162478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+l/KNumtMTGWNi4cIdCRyGHVnnCi7mJh+TTQ304qCI=;
        b=Vk1dP4SIZSCI84SMZf4skZKqDskJu1OFqh2UhT1xm0lfCSenbcIOII3s62JRygfOf3
         lk/e9RcVCWwlaBjV24Xib0dUbZX+8fSn6sAmJDSS4R+0I5EHG/4ft+ywf5Z9g6gU+/NA
         iAuowVivHhlOG3zVohBFL9sB0oxGbJnOujknajHAWrJLc9KUw1rp0LaB8gy3YFK4IzUz
         SLZ0G0fnt3OGEnGC40CCp0LaCbFSD7t4xNzoW8WNHWEjA4m9Kt3iOTgGdtQNxWSJIqd2
         Tb8ZbKPtIk0p/hNVXuFjcFUsjVdDFlbMrwIN/naoBt+PODDMOaj/azfkuMqnZY8Y4UsC
         FWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557678; x=1767162478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1+l/KNumtMTGWNi4cIdCRyGHVnnCi7mJh+TTQ304qCI=;
        b=XWsVd2kAUE9Kliv8qv3+bdgbnzNH/2qe0OZS0btaN62xgUsWQMaRy/tDd/ndW3jLPc
         CSQOSjR2iFjgsygahzbBp/xUIZdB2OgAYqrwuvkB9zvMuCNemNJPb+QIQB3m991irf5h
         dqlod6uaekpA2UoeqdMWzkMLfguzXDzD5S4KuFXBxP1hkkJTRKTaBpxpL8IvcF6VIv5f
         U7eQkTnasMn9N7Cg8Qa51JwUs6EfN7Nx6i0ELRqt9qxcRzE2HDBjIdUqgMFqNzC8kd6U
         u6bfTaCgBxLBUubaiyqu1zqOkS/EKtIKGrA3IyBtCdxTINsgZ4DD5lq0CWvwT+Xk8Wh7
         0Kxg==
X-Gm-Message-State: AOJu0YxSeV/bVpUTEkAhLwiNIcoaO6bDezlw1GYscwBmsQxFQS2+qRk2
	GXl4G0TGrCpWnMk/8euhY15NZHR5FIGBtPYsmO/yluoPR9qcucDgdCPQbO/rA0oIA8neizSKykc
	fFswep6J6LTH3sjCkGMrqQvyJijHgNESbhQO5n0wZsN/9mEDZ7pqPZK3iMTFKYku4abFTiofPCw
	==
X-Gm-Gg: AY/fxX7hxBikZUVd9FS8RxnjPJq07XNsZZeNmW6l2+s4n3vbI7Sad+bHLCzTnDD0KlI
	ZtOsuarzk4r0sb0aCvxh+MRepYIcc08wsmWUwTT3XNBQSoJRoA+5JCHxNEQJ9CmkHKQ+wNtGsPR
	crDJ6Ie8SMVLTlHswfZmS5I3LML/aGZMBlSE4t4n9CBsC5jHWJ5wWP8Vg1MkKqVPSHdoq/Uo/Rb
	yr2RD/iS9V3BjI8cU6bZBkjcDQMO1bnKOtIoBtXiDsqZO6SpuO3/x0DuxGh3lUzsVH6pwMNB/gq
	dZrIq23VNNFLYcIgqX8U09qlleVNn48Chaygcy/FKlm+0dugwTk/hUaVsqb5/8UkFiGYNjoU8xO
	87uAxNagwdcIq5cQBt9AWbqR7YaVHkoPxuP83OYaCfUxmhGA=
X-Received: by 2002:a05:6a00:a24b:b0:7e8:4471:ae77 with SMTP id d2e1a72fcca58-7ff6804bc30mr15661294b3a.67.1766557677776;
        Tue, 23 Dec 2025 22:27:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu1FE4J6q5O1UvJoccxuZNXG1nshn0LtkfTYhJX/wOLuef0Tz0VKj3C4Bs4u79XfEmdJChGg==
X-Received: by 2002:a05:6a00:a24b:b0:7e8:4471:ae77 with SMTP id d2e1a72fcca58-7ff6804bc30mr15661277b3a.67.1766557677287;
        Tue, 23 Dec 2025 22:27:57 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:27:56 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:12 +0530
Subject: [PATCH 3/6] media: iris: gen1: Destroy internal buffers after FW
 releases
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-3-5f79861700ec@oss.qualcomm.com>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
In-Reply-To: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1276;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=LQBwQ5KKiAURRSdH9SPmpV/8R5KpoEVoxpc1FUT4Bqs=;
 b=sQ3DmktSk8EVWqsjPA2/Ve4wcxGMmspelpgTal7NESaqCdsMXLFwRdhFqDmURH2S/SisZzPG0
 yg8VMPk4/PIB3/+DzTqjxF+LUNKqf17Qd8GZmywFcNKrdYuPrEYhUKR
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: zgAyTWSYvXgMfOyyLyY_Zom9qluc_SJq
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b87ee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ClRbyBwZYeV4lDUphtoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: zgAyTWSYvXgMfOyyLyY_Zom9qluc_SJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX9em8MmlH1nY5
 D5uloqrLy2njtOyCDMfKhM2Bx51TbZGaFI67gLXSGHuHuvkPBpBqlcq5SNkTWHyjmcd+cx1j8eA
 IhGJWf6wV6mtLRgPCJKk0U1RSZT+sGdYps8oFg2/99cWAzrmR7zAf1IvAe5Pgi+8wbHHVDahWQJ
 CRTPohdFQ7YF5flm06501DzOxotby1CLA0covtMvfxUxjxgQF+u2QiHzviUYytaIUcb+piEUnqn
 Acws/GkhlOCu42NLMXVVmVe4MTpLjrAgBVOu1Vk8wnkzMgINu2Y7K/H7UDFd36VPf+p7PRCY7mJ
 D0SbJa5vXEoyOpbF5xnoUsSOBsBWJLoH0UqTk5/0Oee7eUI34fbSjBlVKD52Yn3lTzC2LUgD8E6
 VvjpGYYN/J/z9L42Jjwl1NsDn5lrOrspUoOANljvG/sWV/wafZMr0ZpsoC88t0bzKeJLsyOYmwy
 u09mU9gF2HAPFq/t22Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240053

After the firmware releases internal buffers, the driver was not
destroying them. This left stale allocations that were no longer used,
especially across resolution changes where new buffers are allocated per
the updated requirements. As a result, memory was wasted until session
close.

Destroy internal buffers once the release response is received from the
firmware.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5087e51daa842515e9d62730680fb237bf274efa..5ff71e25597b61587c674142feb99626e402c893 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -441,6 +441,8 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 		goto exit;
 
 	ret = iris_wait_for_session_response(inst, false);
+	if (!ret)
+		ret = iris_destroy_internal_buffer(inst, buf);
 
 exit:
 	kfree(pkt);

-- 
2.34.1


