Return-Path: <linux-media+bounces-33710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF83AC968E
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 22:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 827C21C0754C
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 20:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCFE278E7A;
	Fri, 30 May 2025 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoZawHgs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3948148850
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636874; cv=none; b=HMJXQuk6ZhKIFuq15aOjEIp8LZ6T8X/WCR4qvx69LNUXevEFshEyglypdKJh5TvFpvpm9nidHlvPru37L8qF0Bxc8Z7UfAJgIYKhV6gHCc2PMjaYELEY3sTGgWWEs08Xqw6O347oWOTErpKYGikZxmMBvI4AMwLIGHvEtN8oU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636874; c=relaxed/simple;
	bh=yzLs/F7IOX8OsZ82RoPOjGVV3J0Q5pBDHcSeYhHwVqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfWTCkTx5BQshvk9vNdL0zNHaUlAFKuyv1SUUqbO2puqbAHEDT9M38uLcr7hdHzeyOqfmvUshKRP26/Ya2QNPUBbwNKMD3YeBYnt2+eXZ293PK6MYtcCHMsA9ECI1O1mh2D1Gi6wsifsNSuOyCO+mZGY12UVEfVZxTcrkdGUeTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoZawHgs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBgUgU006918
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 20:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5v2/xYy+7yiHHDvsqhV++GxT3PiJTHR6Maiy6xrQ50=; b=DoZawHgsjojpUFwt
	SxU4H9LTBQluKMO/HZnm5sxe2h1vqOEFvx7Gz/9JuOfw7wPWD6h02kNcEQWibGVO
	NucV4bBn4RrJdVZXrULABC9+K+faeWvYooMJkTvnbYRU7K9y4qmmXHbXPxhYg9Kh
	WD7fqJkfZiBKGVUP5RK+ZNcVjXRho8vPppCM52clw7MBMQTnpp0ROCYlh1Pd4o3K
	EyUXftTZlmN8v67aefQMAJ8LW5UXSVaF6MhUmuUjMK8+/qVhDANozNqqls4dZcjV
	Ilyai2Q/NjehoN5dadv5+ifQV2m0w6rLZpJcO2nzraqKTuHF4LyCj5B7wXH4VBP7
	pHZZWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqjkqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 20:27:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so376286185a.0
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 13:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636870; x=1749241670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5v2/xYy+7yiHHDvsqhV++GxT3PiJTHR6Maiy6xrQ50=;
        b=Uuf5Oap1aHCIhQb/3bn86PsB1HVdPRCUGiSZ4y9d5Kmxzzq7gWTOpG8Fh+EqhjsjhC
         eXCREi1R3/Add6xxXW0Wt26DqD7xxkVd6/EjnyHRnNBgsdnhi693IsbDQfrlf5rTAWY8
         3Nnzs3eqtUdvsM0taQDRNSiK8JExLnge8Azs2py99qvR96/ezUZvECqTyr1y1mXVAauj
         njt0dWtsT6vSbzetXms186dl7/eDYcsKm66WIFN1kD+UzosM/qoG7xqPpBrAgv/MHnKq
         JOiBMioqtU99oJ82sdGplpzQGqGlHFqzmoMlQzWkK+d0Re9HnK0MFw8VRX8bEdlrkkhJ
         giQg==
X-Forwarded-Encrypted: i=1; AJvYcCWn06e2FbCP3qjp+HbLIRbvYb0ZzFO4kUCetPShIrpc+G2Hi+7cZL8vvkGtzNeGutQ1hHLQLdCq+y4HYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBYc40vTRDplcC9658T8lZ+EIHLnbUL6POoR9MfyIehyR0BBZ1
	4WnG/2C7ndfHQKpwNjYM1IkYR83y/uydqtfHIGBngF89pDxmlolsm0JKseciyqIV8cSNbRmDI/9
	UgRSSdnaGDPegnt3tOCY9Pcj6ORPrcQuvZLOWQInNdEULjJ3ahLOdoJuAUOqGe0s0qA==
X-Gm-Gg: ASbGncvzmq3P4te/WbT2MLm+z1dJAwdPnPsjAaOC3QatvSj3OOvjXoLklcH/mDuM6Q+
	0W6L/LkoMASiphu7lDpbX7UCQRi3gXGjUB1KfCpuKRWTAND6k2qhOiZ7MMdY5AOrIrUDeKgQ8qN
	L8L0DbSv0CYAHoW0vUO7ETfmg9JCuSw86o0Fo2hjmvCo3MMsTV8TbRRuoGg8RuWttB0K5e80V9H
	txZ0z3y7LaepBDlrA9nQxp1XAI/Qc6d4TuQ/mFcMnbUEzES9pGoZAncqUryIBhFIazmX1fkc0Ti
	TTizdYV9zgBhAF6mupFmSxToUDWV/pIiT5khULlMztswpX3GeJpDZrBDy3TLu5PElNIl4nkvgOQ
	=
X-Received: by 2002:a05:620a:600b:b0:7c5:4194:bbcc with SMTP id af79cd13be357-7d0a1fb84a1mr641656185a.29.1748636870545;
        Fri, 30 May 2025 13:27:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJJZTqm6jwxr1YWdBtUnb7udcZWcz5bEinUQHIB1V9RBVrg2BBGhknwbIWpcoCnMmf4vwrxw==
X-Received: by 2002:a05:620a:600b:b0:7c5:4194:bbcc with SMTP id af79cd13be357-7d0a1fb84a1mr641651485a.29.1748636870139;
        Fri, 30 May 2025 13:27:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791cdcesm819614e87.164.2025.05.30.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:27:49 -0700 (PDT)
Date: Fri, 30 May 2025 23:27:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
Message-ID: <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
X-Proofpoint-GUID: RJZTKRky-pVbEEc-7PIOUcOZ2Fzk-6nE
X-Proofpoint-ORIG-GUID: RJZTKRky-pVbEEc-7PIOUcOZ2Fzk-6nE
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=683a14c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Q_scCxKseVub0b0m9SMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MiBTYWx0ZWRfXyWMZvZwL6Sdu
 3yLUpCyuECaeH3NSRw//QdGXN7vJFOmCaOB2+mkcZaQvvIp4fyx2o3+PQ3Cr1oee8rVNAovKdb/
 cshyLxOMjo70l+KynUemNiM7hRCU+dH+m4XZ0nwt96tR17YckctAapzOjHM3zR7QE9K61Ld3Cs5
 HTPG/ZEc6b0KkJInFRUXtcqde8+p7NUzxM1k4ovZoBi0bWZbMXolmVS7bgMvLjTsvdyYCizn3Qy
 u964R8Q5D9We7GROva9EErt/D2F9kFLecregVQ67J6gHuKvSeC5YFKqbVNfSGH6gym43THI1azw
 YbsH+rX76n6h4ubMM/wx2NYBeTNHGbC5cNSbfjNkzvggj/8Ys9Q3EQNIcMRNAj9T0wfy7jepLmw
 PL5HYMNzr+LpVZe8v/Dh4W8Vdi0oncTtLnroNJivWUHeZp6HHiqbIND2XPrfGRxEAFKw4ED+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300182

On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
> QCS615 uses the same video core as SC7180, so reuse the same resource
> data of SC7180 for QCS615 to enable video functionality.
> 
> There are no resources for the video-decoder and video-encoder nodes
> in the device tree, so remove these two nodes from the device tree. In
> addition, to ensure that the video codec functions properly, use [3]
> to add encoder and decoder node entries in the venus driver.
> 
> Validated this series on QCS615 and SC7180.
> 
> Note:
> This series consist of DT patches and a venus driver patch. The patch
> 1/3, which is venus driver patch, can be picked independently without
> having any functional dependency. But patch 2/3 & patch 3/3, which are
> DT patches, still depend on [1].

I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
on QCS615 over(?)clocked.

> 
> [1] https://lore.kernel.org/all/20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Changes in v8:
> - 1. Add missing tags.
> - 2. Fix the dependency to point to videoCC series alone.
> - 3. Fix review comments from Konrad.
> - Link to v7: https://lore.kernel.org/r/20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com
> 
> Changes in v7:
> - 1. Update devicetree patch to fix the cherry-pick patch conflict issue.
> - 2. Remove dt-bindings patch from this patch series due to it has been
> picked.
> - Link to v6: https://lore.kernel.org/r/20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com
> 
> Changes in v6:
> - 1. Remove video-decoder and video-encoder nodes from the device tree
> - 2. Add a new dependency.
> - 3. Fix missing tag.
> - 4. Update commit message.
> - Link to v5: https://lore.kernel.org/r/20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com
> 
> Changes in v5:
> - 1. Remove extra blank lines in yaml files.
> - 2. Add new variables in the driver while keeping the order of the
> original variables. And remove unnecessary variable initialization.
> - 3. Update commit message.
> - 4. Update the order of nodes in the device tree.
> - Link to v4: https://lore.kernel.org/r/20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com
> 
> Changes in v4:
> - 1. Remove qcom,qcs615-venus.yaml and use qcom,sc7180-venus.yaml for
> qcs615 dt-bindings.
> - 2. Add "qcom,qcs615-venus" compatible into qcom,sc7180-venus.yaml.
> - 3. Remove qcs615 resource from the driver and use sc7180 resource for
> the qcs615.
> - 4. Use the frequency in the opp-table in devicetree for the driver.
> For compatibility, if getting data from the opp table fails, the data
> in the frequency table will be used.
> - 5. Keep the reverse Christmas tree order coding style.
> - 6. Add "qcom,sc7180-venus" compatible in devicetree.
> - 7. Update cover letter message.
> - Link to v3: https://lore.kernel.org/r/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com
> 
> Changes in v3:
> - 1. Remove the ‘|’ after 'description' in the qcom,qcs615-venus.yaml.
> - 2. Add a blank line before 'opp-table' in the qcom,qcs615-venus.yaml.
> - 3. Put ‘additionalProperties’ before ‘properties’ in the
> qcom,qcs615-venus.yaml.
> - 4. Update the subject of qcom,qcs615-venus.yaml patch.
> - Link to v2: https://lore.kernel.org/r/20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com
> 
> Changes in v2:
> - 1. The change-id of DT and driver are removed.
> - 2. Add qcom,qcs615-venus.yaml files to explain DT.
> - 3. The order of driver's commit and DT's commit is adjusted. Place the
> driver's commit before the DT's commit.
> - 4. Extends driver's commit message.
> - 5. Split DT's commit into two commits. Add the venus node to the
> qcs615.dtsi file. Then in the qcs615-ride.dts file enable the venus node.
> - 6. Modify alignment, sort, upper and lower case letters issue.
> - 7. Update cover letter message description.
> - Link to v1: https://lore.kernel.org/r/20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com
> 
> ---
> Renjiang Han (3):
>       media: venus: pm_helpers: use opp-table for the frequency
>       arm64: dts: qcom: qcs615: add venus node to devicetree
>       arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec
> 
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts       |  4 ++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi           | 78 ++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 53 ++++++++++++-----
>  3 files changed, 121 insertions(+), 14 deletions(-)
> ---
> base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
> change-id: 20250526-add-venus-for-qcs615-a547540656d1
> prerequisite-message-id: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
> prerequisite-patch-id: afd2dce9e6066b1f6ce0b41ceafe0dd47ad97c40
> prerequisite-patch-id: f8d64c8cf6cd883dc7bbb2a4ed6d5a4db85c536d
> 
> Best regards,
> -- 
> Renjiang Han <quic_renjiang@quicinc.com>
> 

-- 
With best wishes
Dmitry

