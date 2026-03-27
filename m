Return-Path: <linux-media+bounces-57355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCMuNOHpxmloQAUAu9opvQ
	(envelope-from <linux-media+bounces-57355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:34:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3AC34B0F0
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7864D30F0796
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D12E392C56;
	Fri, 27 Mar 2026 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvsjKfSV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHd22pUf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3D392C3D
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642802; cv=none; b=BTuAlxiRPbYMMVaZ8VUJrFOnQChfuOpf/ij1ilV5wGhG2/G2kYt0P8jfnyKK73fHTTWW5cbX31IjW90lQv41aUn7xd1/DcMlS/lVlWGtYQdFempb7SAM56tA9EArt1Fj9D6H9lYDVT08l3XIea6kH6rfddxpoeYVJUtNyHCsG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642802; c=relaxed/simple;
	bh=6t4bZjQEwVJSE4KMbGmyYY9zqlqufbdXRAFAjFYMPJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzUpdgF1yx3eLbAYww7bmuJ0+O5V1pO5DPJ3xTCUe/y5ZV9yDWXvTJC8ViLSm7/Zw3nBHq+Vjxmh4j/Az12OcxnJCaxugBydsOMLfSBms6VWpGjYHEaUxecdvA5s+LqOcm5aNLMXivMDFXvrXlQZD9Bi7clLZwtl9jxjZ4dWyBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvsjKfSV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHd22pUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2Pem4030359
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MWJF3hIMhRNf4dgGFUhsIdW2b9aOdxhV9FbfIMi59s=; b=SvsjKfSVNsxgYHf5
	v30pry5Ju5lOKJJHU3zzNzvzJyTdSqfHgW9qWwF3F0G9z0nLNKNiu0qmaSUIs5re
	KX0RI/3gQfvGQBWJ5qZ3mKOSKDnXWAD+bU0qnZmXw5k7VHCBXe59+IJ1fNLyFTYs
	9fJXD4kbXlAFK+c9mBRJEJUAVw4fFcj3+AlFqmZgVb23TgERhZvPjt+Bo4X/lndE
	5JZSACmrcMvKJl1vVjgANUm1M9W6qBjFsVcIOEh6+Pu9WLSh1qPYhYwjoALzSmAJ
	8tqFo/dUkqiIEj6qhvNbllwpVDuqRI8Xv+pfVcGh85Ri1KwFB//PZh5GIi/vv7Fd
	FelLEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b122h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:20:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so4777711cf.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 13:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774642800; x=1775247600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MWJF3hIMhRNf4dgGFUhsIdW2b9aOdxhV9FbfIMi59s=;
        b=bHd22pUf8D4ZdqzJ0Sb7n1v3kSfD8s6zaWZgGIcWmLjotDkv/UAgb9eJU8AL7YJEHM
         Tel/9IezA12E7h1nNvyTNgyYntG2yjb6P9z+AcCt3Hm0FfOE7v9xAiTRCoPVGvhCIV2H
         injM/9oexYBcO+0yDfnIsSALN8DrWWsloFFzlPVSkn3v2WMqaM6zGQdnOjYgonG4+TjV
         fP4P+lIuGCodIu+Pqs6d3uZzUYGZZGNpnOVuRQGpHWwgXcV5funy5P6YprzDi3JEVXWb
         tjYaDY+vjyCHV8IG4wYfXNSNqxTCSh27au0ICH2U2Uot/duzOnvXoIsajGGKqpBc4ZtB
         aL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642800; x=1775247600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MWJF3hIMhRNf4dgGFUhsIdW2b9aOdxhV9FbfIMi59s=;
        b=Ywemvr8zj0KpxIb42mKXfLvRH3EMNZq1lT6krFkwBPnHYyffwPw4Wz0j4M4BJZvg3x
         LqSr1nzEz438Kofjh9TFuEdaca0+2oaSi4mIqMB/3ZbJVAMElzQPR4Cy2/dc2jGuFliT
         4hUaLFHmLCnH5O634s/GJXDgHijQ1JPNg3UYhLozasNDOQ/Os9BQMJdN9vMB4eVxXndz
         jH7OkpALJYxa46CzFy+N1DAXrd1EZ1srxykP5zNeh/9FRYdzccM8WNa0TmlyU5djbobB
         Kg9tAffRxNiTRn+76qWfm6UF9PJ0pgN6xhCUlFNAX7plFy0KrnnJ/TgUs9PQqGXttFOb
         I53w==
X-Gm-Message-State: AOJu0YzqObzl256vG7MZsnaofBzKBOJsnVuLbuTSKaBeUOn6Wo5PUzeY
	3ZPBaHoKA2yIDuVYNarluqkYuCZP1i6bczyk0tuRRLO8o/hqEHnTR5C3rayo35vPpUnhCJRcY0f
	CQtMGafSle/2p/CLJjj5EKS4/T3LlJaPsiaccjf1Md6NnMpnSvtBdM2C1yzXhsiG2Zg==
X-Gm-Gg: ATEYQzzZH9sUwTfl+O8w2ixZH1EHnAbjEoSBrGWR3/lfPSJusJPn2EMqh/duDuGV7xK
	6z3kzxWE1z9fYMIlPQ8ujHKa/lN1NfSwyGkilJ28CsT19jvEuBmsyv+sh+9GL3zb3RYGCQsptnx
	D1OWw8pNUNuLk39Sp0JZ4BYbJWSrz5n2fHYfH1HatJbe2h1vwbriYgUJp6hlGEouFKAihznlk4p
	3L6OXP9ew1U+5QmloksQwLfh4b92HpxNR7X8O8GTXZaQNkENEFzpMz/MuQc4KhdwDwU9alOpkwm
	+JVVZly9403iY3Nb8efNvsZLl+fA7eVJxA9dHjFMgHM+lRzhbd7a/nedfddxUiBaGmCuB2K/jHF
	ScRMJxwPyTdCOEcghiEaIe0gOLaTYFhdpDgG2whShpfKCVNINkrLLBmpxoS7odW29+XN0kcxvKL
	GNGR/Xz5iAQutTv78FymZSxbcgUmflVoNeT6I=
X-Received: by 2002:ac8:5a46:0:b0:50b:41ec:5e85 with SMTP id d75a77b69052e-50b993de828mr91194851cf.11.1774642799675;
        Fri, 27 Mar 2026 13:19:59 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:50b:41ec:5e85 with SMTP id d75a77b69052e-50b993de828mr91194441cf.11.1774642799194;
        Fri, 27 Mar 2026 13:19:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm506581fa.19.2026.03.27.13.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:19:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:19:53 +0200
Subject: [PATCH v5 1/4] media: dt-bindings: qcom,sc7280-venus: drop non-PAS
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-venus-iris-flip-switch-v5-1-2f4b6c636927@oss.qualcomm.com>
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
In-Reply-To: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6t4bZjQEwVJSE4KMbGmyYY9zqlqufbdXRAFAjFYMPJU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxuZrqy6cO8rm/NDV+bNsxyZdigt0/CjbrrBib
 BDGrm4UK8aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacbmawAKCRCLPIo+Aiko
 1eV1B/9mtpXqB9uYdpFRm1lqiblwHwviRF5zEvOtdJ+qT/pG40hMN5PYhOcjDyeAjqmCGXR81Zn
 FWLCEd+ef8Mx3+VHkF/3v9Kk74/FpumlGObDW5bnt2dzl2unSn8mfms169p9TKwI17NxrI7wnmU
 mfFvULP+omrL5hhuEVjQRPCnd2INr7BZYWXGz7sNfhu0ncqyRDJIXOq6B2+edfgBFHd0ViZpse7
 VD059RYZ8ZYnO+cMUZv4pYlAPvCi0H0dy3RZoGwlRqsq8KwqSEyoqwQohyBE14Q/kvAE+ykN7W5
 K4XjNN11qXtwsOMlSJ6BH60s9XW8xYmTSyMtvtk2EUf5MWBK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1zzemoI-_gqIAXOnNqI-03b-pP1rlc4c
X-Proofpoint-ORIG-GUID: 1zzemoI-_gqIAXOnNqI-03b-pP1rlc4c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MSBTYWx0ZWRfX8enTn4066Wpg
 Njbx5XyVVfFlADL70WUi4DuS8yRjD3HI6VlRRCcBk7UqOpQHut4GCN/5lRvbRJVm0fyJmGqlfGH
 STN5HwRK8UH0mAkLPQ1i3Ne9COsVubsCnQANLfKgQSpkihwrG/VbjHtV8UbUeJAYzt5MalExiT/
 wyWHMiZ5FHf4hyeRcdGJEL2byev55naNmhZpeejzgOR/F8fzIWaKlZhbTu5LHFR0zfOrIw6LNKD
 tKjE2dj3CK5nuSuCq0HrJ+D1FUq2FdKC2A6BdRpJr7F8VvKTOLlIXQWNVK778JVLVflwfTJ3O+g
 RNugXq3Gtjn669kbT2l06SGr3VbmEGnTAuFTeCU2P+U9dVZqCUz1kEyIgUWMamsQjwOVc0Zs0yd
 Tr25bvYsU/dZloQkEK16rdjEIuVRT+UDGqw8JBfjRZRxhvsEXTYdXxQDQ6QK57R0njnyQH5RkzE
 lPa+C2ona3s5eSKxdwQ==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c6e670 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zCM7-lDapuS4FQW10A4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57355-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE3AC34B0F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The only users of the non-PAS setup on SC7280 platform are the ChromeOS
devices, which were cancelled before reaching end users. Iris, the
alternative driver for the same hardware, does not support non-PAS
setup. It is expected that in future both Venus and Iris devices will
use different ABI for non-PAS (EL2) setup.

In order to declare only the future-proof hardware description drop
support for non-PAS setup from the SC7280 Venus schema (breaking almost
non-existing SC7280 ChromeOS devices).

The dropped iommus entry reflects the extra stream, which should not be
treated in the same way as the main one (which doesn't match the usage
described by the iommus definition).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 413c5b4ee650..9725fcb761dc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -43,8 +43,7 @@ properties:
       - const: vcodec_bus
 
   iommus:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   interconnects:
     maxItems: 2
@@ -120,12 +119,7 @@ examples:
                         <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
         interconnect-names = "cpu-cfg", "video-mem";
 
-        iommus = <&apps_smmu 0x2180 0x20>,
-                 <&apps_smmu 0x2184 0x20>;
+        iommus = <&apps_smmu 0x2180 0x20>;
 
         memory-region = <&video_mem>;
-
-        video-firmware {
-            iommus = <&apps_smmu 0x21a2 0x0>;
-        };
     };

-- 
2.47.3


