Return-Path: <linux-media+bounces-61418-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJplIn1wBGqiJQIAu9opvQ
	(envelope-from <linux-media+bounces-61418-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:37:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E461F5331F4
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82D023048543
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2B741B37B;
	Wed, 13 May 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPEz7chM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuA2mgiL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA63932DE
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675691; cv=none; b=Z3x6uCEasr1Bm8uGI2Gr7YvuBbv1aOHDXvi3f+q93GLAD8UaOMbbzDhERfboFiZGdXih7kA1s2crdzZ9TjkJ2NIzXMu2TyxEqAHSci0rVHU0zO6Be5LRHq6kJc1YOYs2rCm/y4vKZtvdkAtvYLa9ridBMV6fNl44b77h1pcMkBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675691; c=relaxed/simple;
	bh=odH0XPGUBUEoONIW/pQRQ6OSMaxCb4x5NUbb1dQXZQo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aNPEuCEnFS83cLRqmREy8xH7cahrcVwZDHBD3W5o5/TH0XU3lbQefLpTvZfU2Q1SLcnF+N1V6f2WqCdvLpCK3TLeWtUtT9pb8bx5SGABCJA3nvyfXuP9s+oImWsRN5dwEr7j6EoeyMQAAlEAg6IKZF9locWd1cKcywsaGdY8XJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPEz7chM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuA2mgiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rMq34082621
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NUBWu4iMV6F0cWLaAxgrOJ
	YV1cWMmw7z791GKZVNAC0=; b=YPEz7chM2SbynWHyUoVRKROxfXAO/OwTcvRLq6
	qEjPNSqZ07xoCSE4eZ7pT0Gltxz8884Rl4ClOmzBULmvritQSr+cFPf0agiBycvK
	I8jEt/MQVg1gJlT3NdlIUifHnGLUdYXuyh+yPKX2Ef+cSINrHMnLNJymAhdyVQso
	ql5DRlylzVDkLQr3a6J23DwxYd+D6evvIpt9h9MtnPbqCm369l1gX+wiq0NJfOpL
	dLXER6ozqb7Kh4T3Bx2zIjqtJWA1GftQ2xuPaj/loRNvr5GgPqykSI6+Tbk10RQx
	oJwlBucb3eOTGFV9hMxZdPtHPei/J0U68xge9kFa95k0KJqw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0s6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514ae0edeb6so93737161cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675689; x=1779280489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NUBWu4iMV6F0cWLaAxgrOJYV1cWMmw7z791GKZVNAC0=;
        b=cuA2mgiLjDjBWZbMNFevQE0UeMMziYOg//+mE8BddtaaePwp/tILcjV3HiisJOyTD1
         y2bwprQvRBjCtatYFKl7C/8V+i1vd4++XLrs/QV/1pyF/8C/4OxXO7K+nC4ko5wK4JQE
         8dHUofhegFrh1KfUHaq8z+Mu6NstRWogNacYzqyKtA6F7Y12HJTWavyUlQzNj7aR6PRJ
         4yF2cQf6Oao9qi7+oCEnasXoMnvyOYf+xAW3rVURboSYuPld7Dox+rEwLdAShEvOy0YH
         uyzRnuyyA3N47tGX3YMJeWXvL9kRxBfIXyVR2P+EmpWcLUIrOKML7YeKOnD3yxMg3z5W
         cLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675689; x=1779280489;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUBWu4iMV6F0cWLaAxgrOJYV1cWMmw7z791GKZVNAC0=;
        b=ohda8FMChsSf6kLUp1/wBSzM7o2vc8LhwCnT8fQhsYYp/2KimiF6qDjzmW2KxJKeFF
         xH3Ih63LO2CZ9isKa3jyE/acwpjxG7Wfpu9BQxn34x3Ekp3cjA1Puf+pzKd/u67hWIzT
         RPaIWfRHWku/a3tLULC2Bv0FT8Y2NjVgYQtKoCOZFbfsofwucJpqUnyic4WqITG+4iIP
         B3s7jF88kuukRvGIGGQ8cGhSRUecgzhKkKR7v48Fff0+IYWiezf722Wf4lxc0hsWiv9V
         wjH53OTbA5VB48vOnCLIIwA5J/KZ6OAT+XdATcnq8CScpZpHJnbM90HjWL4ccwER6HU0
         jMDQ==
X-Gm-Message-State: AOJu0Yz7jV2/EarK92LaysoU5CA1dmzpjTbTetqKBJNRKLhNRq68IQ50
	3DuLgOeCGysrdMxARtn61VEFWCjsWbRFKP1mX01MYRZeketPZDYKR4bozD142Wlz2WqYgL3rZeh
	VCVRo8pdcXXHXj9vm84/l7DXfV+xHwL5SXB8cWb4XuVoy/F1ZOV2xSNLOV35LVkyYNQ==
X-Gm-Gg: Acq92OHhuz1+OAz9yrRGlfaECa9kg1ujvIvqOvK9XqE5bNYPi2e+5q4/VkuwDMT/CBq
	rK8IQxud1RBX8F5qkRvNY3C4+oQehVwE8k4lZMPltiqAOXs/OjXjDyZYQfpzmAW4lhMWuzjo+gc
	q4ErMj4WXOSzzmgXkTKSsxsUgREX1pmDPJZK66UizUvhRVWQfvZ8xIC9auMsPwiOZuanxAUO+Uo
	hvRgJ9XRdffeUzZp3eVLoTgUNnVY5N3c15ZShqtRrqLlj8ivFGXhWgJZHk1GBXIpRQZmI3qXx6I
	q/GU7gNm4yxIGILmhYWWBU6UKrFIrsN6JiS4mjpGehtNIGhxpNTvWNK7XgD/dQ4kzzt6dkbWIxp
	ri1fI35ojEyyZ7lpqGHa/FblfMTeHYtcU7Boatc6jUFWT/ffS8ZCQDEkSU7gbjaXVZl/sXd9U79
	0jrGSl7uiBKEQxXFRbTgGWxmpUYzQ5/FwJCLQ=
X-Received: by 2002:ac8:7fcf:0:b0:50b:2dd5:2be with SMTP id d75a77b69052e-514cef5f0ffmr99692311cf.13.1778675688463;
        Wed, 13 May 2026 05:34:48 -0700 (PDT)
X-Received: by 2002:ac8:7fcf:0:b0:50b:2dd5:2be with SMTP id d75a77b69052e-514cef5f0ffmr99691791cf.13.1778675687771;
        Wed, 13 May 2026 05:34:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/6] media: iris: enable SM8350 and SC8280XP support
Date: Wed, 13 May 2026 15:34:42 +0300
Message-Id: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONvBGoC/33RzW6DMAwH8FdBOS9dPnAIPfU9ph1CYtZIA9qEI
 qaq7z7TbqrUjV4s/S37d7DPLGOKmNm2OLOEU8xx6CmYl4L5ves/kMdAmSmhjJBK8Jhi5tlbZcV
 84BaC1I03ArRhtHNI2Mb56r29U97HPA7p68pPcun+SvAgTZILrjygqVuHlWl2Q86b48l9+qHrN
 lTYAk7qKaIIAVA+eI3O1HIF0U8RTUhQ0hrpanRaryDlHdFSPSIlIU6UFbYSta/CCgJ3BP4iQIj
 1XoFEqxuw/yCX29UTHk/0vPF2eta4jHwZiuO26DBE95NGTPm1x3mkzcs3hsxuyP4BAAA=
X-Change-ID: 20260120-iris-sc8280xp-85d13bc60536
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8809;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=odH0XPGUBUEoONIW/pQRQ6OSMaxCb4x5NUbb1dQXZQo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/lxkzUzWYzkaZfxUC4KE93kJ6Lfj/nEqzO1
 CDF626rguiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1Z1AB/4pnJ+N3GZbN0ocMDx+E1gTrqvOaFjKSgHZ+1UL+HHnk2VUq6FsUwfplcVK4Rz/Tjeis62
 iJNihiBx/AQzIb6Vu6fKFAw9x5gpPV0zA4UbneCQDG/f8mUgNAQHJKKWxLy2DQkawgr6/8B6nKn
 h01ciMvbzuNrzRmyw2y8ymD2XJaxubc/CdUxPqlgq9MGqSoZ1IQdv7S5kGkvFKFlez2HLsUD0so
 aglLfsWE56b609vP5phigVRGU2eCnwmjRbXtdKB1xO+gfxcy56Z1ou97VP1AcUP67FLrWP+wHUN
 rFfe+sA9uqpLI1RMcXnYBUFm96mx4Zn+P6YE3Zva8QYWzTkW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: BTcb3yxJdcHyuHQz3WKAW42NyvWC8VsT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX8PLbJSUr35Zj
 TZFc9fzS/RCoWkcm1DriZPY/yM9D0PKkKXiRlbfaN8eG6whPw2DAUOldOzbNeA24swaoLBtGdXJ
 3T1gNWgZ/EV3bsdtjGaVVb3EFVaE7Sccp6Q/P81zktqaMLPqzMqf/OWjfCR0o9wb14MAdcMAaU1
 KKInoNe7ULR69MMTQ6KqBztNJycr6Fkve8wt9TOI0oVlEwjX1lV8kDkvcULjH5ZbnJxCIGyVX4w
 bAELZtmgRRCN8+lQ3psVoRSi61JqISVqhIfoGoIM8ogOQ28bj9FHbLqO8adNNftFdk4gdY4XrNN
 gi4/0tdTfbi04M4nclul6/GNLbGIS1xxCwUlc4FdfJ86LFEwuHCTtwF3y+LnMIDsw/9fkfiitRM
 hCNL/gVJrANpqsX8Dyrm1VaH9n5kqOSennUulS5eJcpc3eKIbrUS4N65eCYPCzoRdGauwEXLato
 YOMcZAN2WDQkNly9duQ==
X-Proofpoint-GUID: BTcb3yxJdcHyuHQz3WKAW42NyvWC8VsT
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a046fe9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lfk3Eeg5VSayILi57ZsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22 a=mUDYQMy1hxdww3aAYIDK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: E461F5331F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61418-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

In order to enable wider testing of the Iris driver on the HFI Gen1
platforms enable support for Qualcomm SM8350 and SC8280XP platforms.

Note, this has been tested only with the Iris driver. Venus driver fails
to boot the Iris core on SM8350 pointing out the UC_REGION error.

Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
SC8280XP). Please use corresponding firmware, extracted from the Windows
/ Android data.

On SM8350 with the Iris driver:

$ v4l2-compliance
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

|TOTALS|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
|-|-|-|-|-|-|-|
|TOTAL|169/316|128/316|154/447|126/447|159/311|229/311|
|TOTAL TIME|242.251s|267.903s|293.458s|261.934s|203.009s|366.936s|
|-|-|-|-|-|-|-|
|Profile|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
|BASELINE|0/0|0/0|3/7|4/7|0/0|0/0|
|CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
|CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
|CONSTRAINED_BASELINE|0/0|0/0|32/33|33/33|0/0|0/0|
|EXTENDED|0/0|0/0|1/6|1/6|0/0|0/0|
|HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
|HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
|HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
|HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
|HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
|MAIN|127/135|126/135|41/90|41/90|0/0|0/0|
|MAIN_10|0/11|0/11|0/0|0/0|0/0|0/0|
|MAIN_STILL_PICTURE|1/1|1/1|0/0|0/0|0/0|0/0|
|-|-|-|-|-|-|-|

Tests failing on SM8350, but passing on SM8250 (note, on SM8350 they
also work with FFmpeg, but fail with Gstreamer).

- AMP_E_Hisilicon_3
- AMP_F_Hisilicon_3
- DELTAQP_A_BRCM_4
- SAODBLK_A_MainConcept_4
- TILES_A_Cisco_2
- VPSSPSPPS_A_MainConcept_1 (this one timeouts with ffmpeg on both
  SM8250 and SM8350 and fails with Gstreamer on SM8350)

- vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm
- vp90-2-14-resize-fp-tiles-8-16.webm
- vp90-2-22-svc_1280x720_1.webm (works with ffmpeg, fails with
  Gstreamer)

For SC8280XP (Thinkpad X13s):

|TOTALS|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2|
|-|-|-|-|-|-|-|
|TOTAL|158/311|232/311|93/447|126/447|166/316|133/316|
|TOTAL TIME|85.753s|111.439s|359.253s|65.825s|79.435s|88.543s|
|-|-|-|-|-|-|-|
|Profile|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2|
|BASELINE|0/0|0/0|1/7|4/7|0/0|0/0|
|CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
|CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
|CONSTRAINED_BASELINE|0/0|0/0|7/33|33/33|0/0|0/0|
|EXTENDED|0/0|0/0|0/6|1/6|0/0|0/0|
|HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
|HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
|HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
|HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
|HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
|MAIN|0/0|0/0|20/90|41/90|124/135|131/135|
|MAIN_10|0/0|0/0|0/0|0/0|0/11|0/11|
|MAIN_STILL_PICTURE|0/0|0/0|0/0|0/0|1/1|1/1|
|-|-|-|-|-|-|-|

The results on SC8280XP match the results from SM8250, the only
additional failure is VPSSPSPPS_A_MainConcept_1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Corrected the indentation in the bindings (Rob)
- Expanded commit message to provide details on SC8280XP failures
  (Vikash)
- Link to v5: https://patch.msgid.link/20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com

Changes in v5:
- Rebaed on the pending next tree.
- Corrected Iris block name (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com

Changes in v4:
- Changed compat strings to use -iris instead of -venus (Konrad,
  Dikshita)
- Dropped separate schema file, switched to SM8250 schema
- Dropped driver bits, it's covered by compatible string now
- Link to v3: https://lore.kernel.org/r/20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com

Changes in v3:
- Add missing header, sorry.
- Link to v2: https://lore.kernel.org/r/20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com

Changes in v2:
- Added missing chunk, including sm8350-videocc.h, lost in rebases.
- Link to v1: https://lore.kernel.org/r/20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      media: dt-bindings: Document SC8280XP/SM8350 Iris
      arm64: dts: qcom: sc8280xp: sort reserved memory regions
      arm64: dts: qcom: sm8350: add Iris device
      arm64: dts: qcom: sm8350-hdk: enable Iris core

Konrad Dybcio (2):
      arm64: dts: qcom: sc8280xp: Add Iris core
      arm64: dts: qcom: sc8280xp-x13s: Enable Iris

 .../bindings/media/qcom,sm8250-venus.yaml          |  12 ++-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 103 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   6 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  81 ++++++++++++++++
 5 files changed, 203 insertions(+), 5 deletions(-)
---
base-commit: 10f943b12e7cb338da00f10e129043ae27b33af4
change-id: 20260120-iris-sc8280xp-85d13bc60536

Best regards,
--  
With best wishes
Dmitry


