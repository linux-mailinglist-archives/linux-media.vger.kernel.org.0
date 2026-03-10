Return-Path: <linux-media+bounces-55082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA9PDWT/r2mmdwIAu9opvQ
	(envelope-from <linux-media+bounces-55082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:24:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAAF24A958
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 553F3304593A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 11:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC9B3A1E96;
	Tue, 10 Mar 2026 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXrm2uLQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGmXjyCf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9B38B7A1
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141778; cv=none; b=RxUGZqSKVaWqpE/+c/Efz4/eYSYqcNGLrmIzU/wiuORxigsdNyxg3FcZhxxdsj+lr9GfwwnlYPS0GFhoxXWVPzjnNy5lw0Ba2Rbhydku1kvPTF1Tohv0+Gp3FPr4u8/hW8YUal3yeXDn3VHuFIQyiNY3n2witKg/eErsUAAFyj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141778; c=relaxed/simple;
	bh=ObSXKiR97buxky/PvKOJ1j+VJH8Bidr34n3hBEMA+cI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+gNDVq+68GlNEZqvcrO5wT2V6fEW6gvlcS9hpMDJbhwucfLFY9WucyTkaWe7XjedI6vCjs8fh3jccQkIjv/nK6Vk0t9SG6cpOMM/ahPVkrsqCAVHMcXfZB0wUKWecOYoAZOxttjvWhAQ6/i1tEY/FC5McOHzU7RIVs7hyS6dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXrm2uLQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGmXjyCf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8paV53690626
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=; b=JXrm2uLQKi7kTLgq
	M7V7Qg6nGlbCoe0gBMQXEx0E76BQcDjn9GoWrYegfbm1H3BfyRxczwgHHnF/D6X6
	xos8XT9TiW6puiE0266007cOQwQIEgzlYToeQcuRE+N1xaWzaG47wFdjrKl9VLqd
	/GRCCMTiXlVj90sMlIXXUMXTW45vp5glpqdgQpRjm6b4O8eT3kA2b76zr2BZfhiU
	jM9QrP89Vzm5HvyePCqwwzgoXkt2aq7ldbf/hRWo7HTpdpzQ0eMbeiLsESVLLU0W
	nYA9iCt5RwjXAVy05ov32SpzNz8J0dTces544DVoZyFfKrPIErRD+QV58eOeGTYJ
	yxGDOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ngm8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81506677so1327446585a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141775; x=1773746575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=;
        b=BGmXjyCfmjS3LU2S60YWEtVcuiKrRP3oV2AiCMa0d03yIqhaRNEQizAozKJL0OM1y8
         5l7tuoA4eGUTAKjwjLPM1Zsx+AIW/fTchTJ+s6j0eibViZ3FZ5dIDbWqTdYvZoYWNtHQ
         n5glVVLzUoIXXZKqMwJpOzdPVUIaB9jwqyBYFDICgZO5aiyIjFdmNOJZLl02fn/+PtBs
         nRXf0CDZEWnVhjYmE4wSXR74lL4TkPTyZW4i6ygxAwrEbhKKmGniw1pNkcLIOihMEceh
         7koK4PRkUI73rRgUi/fchBWfA26eG28g45SQ+/8RuqCTy1vk9qWqEvAorjUACfOis6tm
         vEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141775; x=1773746575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=;
        b=LDqzpANxGYLtXIAT4EqSgE95XSjRWe8IUzI4PNcoZ4WRhwRLBzJFQXFESeEix9hjHM
         N2fxI2exps4du3dmTBeOCpwGI+Y+heAzy/ZNAuf9vtLaRqJpdcScs8b9JW2PZVfBLUj8
         RpU/82sqh9vfccPLiBxWMgWKNykcrHxISf4D/EE9Lg56xSOE5q1UrIEIaPGlPFAUGyD2
         MtetQNYiFIVac+i5C/iifHob4KfOcGWl3RP1B2hBQTMrv2HpaGQY2UI1ceLWUBEKp86t
         BmNdxWlCouzwb8wQCjvkv5UsxiDXetMaEAXHuDtznoEzYsCEzcreUmgkyHwp5RN8ezmM
         QBSA==
X-Forwarded-Encrypted: i=1; AJvYcCXuY7weIqh3+G7eqiABzN7Cw1NhzDUjRvonrRcwGQCHoaczIPv2HxS19Z8kM4gghOIRXoc9EHsiXQk46Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkShCKjYArNSbsfLs5+ikPcXk+0NNFelgfNdBo6+7Q0rK2Ge4T
	YKXxXDm9awdFpIZMO7EqWnslJk2o//TPhy5SHrvEQ6/NSvrsh3NYuLynEqB+UJe1XdJKxKw42zZ
	4ge7vM8Yajr/cs9kit/8Z/SF+q+gulgQ1CDNuW3L///Dw/1l4A4ekho1hYJQ47NlFWg==
X-Gm-Gg: ATEYQzwqJqMcH76KX6Dxjd3ZCou8AsJBoW7kpTAzkNOX+KFkkzW4HsXlnQRF9Z+KWKm
	NPjEg8JB05rHN0vsUCVupL14FNZAZDkvB+lTfT00wt2Mz+OLW1X2nwROWSumfWQSbu1daRVe8Lx
	zijtQYUyBc5X39wjS1WhIK9BQYXOA3RPXWdBTqEjJECoeaiW0DkT/pYck9n7d4AW7kRUkkx6pe2
	qyUREL4X9lBfCGtjmL5GKQ4Hjl4f9ya+NUtnwHywji7OYcXfIikmcAmXISxrdEmNKmd0ga+Dpfy
	DPAQAKsud7FsQMO47licbYf30ENFEQLrygN6ZxKt5WX1thltno52UzbstVeLADQF3f6zBp/hKrP
	ref5tA7nV+/N05SKug6BoYyOM8Um01e7p5R5JSna9Zwxi
X-Received: by 2002:a05:620a:1a0a:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cd97a7a6b7mr115247185a.6.1773141775142;
        Tue, 10 Mar 2026 04:22:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cd97a7a6b7mr115243385a.6.1773141774703;
        Tue, 10 Mar 2026 04:22:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:38 +0100
Subject: [PATCH v2 4/5] ASoC: qcom:: Constify GPR packet being send over
 GPR interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-4-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5803;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ObSXKiR97buxky/PvKOJ1j+VJH8Bidr34n3hBEMA+cI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/8BBvkL7GdnzghQsZVsVzlQ6xuKDR8hY+hPc
 IpGCSsqCf6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa//AQAKCRDBN2bmhouD
 1x0tD/9jKwfDmntMF5yMlc1fEIOn5KFtHA3kOJbdg8NmqavLKwylVyFbeRfeIELfVTuJTZPiP2J
 ntjYCKKtRvS6juhf1SZsWvs0nGc6J1cQ2Z7htGENVpN/h6pr2g9MYj6jOL7rsWyOIlHxGHcBjiN
 I3QNpG4bZFEGc7nU2MzcusCMtM/T+qiYut14SX9K8tZII/QnJ+VofsnR9zT08J0Y6+jvCrFv4LZ
 zXWvC+NnQgfqmOWRaSsG/nFNY5E2tQP7CJf/ZKxwHYZkqTl85W3yBqFsubK57XGQo56jARyyb+C
 1aIHQE3xwTKWpHjtaAnNWFJ0o31UaSBStTRywTRe4UGcKRhqI3HMTXpcK2ODrMO/M1koglao1Be
 EdaZHY84dxuG9b730qn9ZoP/AO/oVFz9quLdSNTq+qR2/n/8ah1dhBOjtQOy+2PhdFowFFxwqlt
 nZgDqMpCjsTqq9AFXe4pUGYrl/pEfqQZEnmx1/8V0azDfVELg697mUAJ3lgjE9yL4wozOBW9jii
 M7E2FpQFh3XsFTajda66ebiHfXhGouXlwFfVKadNOlRenl0XLLb7HOf5DmM88Q8vCzbtU00ZeDv
 wEt+JIrBeEi7p127S6TMq/2mMebHu+00vydMR5HprYQk8jHuivG2cOrKMXgO/FkhTAP9rNqTmQr
 QgwaVSTGAqkjazA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: hk0SZWCP2GMCcVaSgLgVWyEDCQ2vONq3
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69afff0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qTtUXMQ633XYL2vtSbcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hk0SZWCP2GMCcVaSgLgVWyEDCQ2vONq3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX29k2SM2jlJjP
 ow/jgqRjZcdXrt95j6va4utbKoy0CrSi6XILB+nAekshjgpVmzFem8vaF2DVonGz5xFDx4rS5EH
 ZouWSC+/Yp0tHkYO0QJoNfhuraplnksZMjtPMTL526HCDN45BauUluTXb+otKGK4xu6rnyAvkFJ
 d/skBUerxTn5QYMWBgUcq0VLLhWJQXb1RQCA7LZRe986bFCmvi8Hzi1nsuKTSBkjCitWXS4xS6I
 uJyjen5UuB/XtUuw9nlZ6EdyH9qqh3N410IkbDIxyzz+SC4lzRmqANDgS+IV+5BhBQ9DlLZroN9
 nTuuqXBc4maJVASaNrkIXkE3IBSqv7OYFW8QsH97eHfTDn/qwvC+LPU/CxyvZF5mv+T28tC6sm6
 wSi2LSk7SYBeCtpH95TT3140a9oRfVi3Y9u5ijyfCidhDEJVRGqmCPX0KplrG0f8rniaO/ndqyq
 r1ntXUq0Tdpxe7QXhNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-Rspamd-Queue-Id: 1CAAF24A958
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55082-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

gpr_send_pkt() and pkt_router_send_svc_pkt() only send the GPR packet
they receive, without any need to actually modify it, so mark the
pointer to GPR packet as pointer to const for code safety and code
self-documentation.  Several usersof this interface can follow up and
also operate on pointer to const.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on previous patches.
---
 drivers/soc/qcom/apr.c            | 8 ++++----
 include/linux/soc/qcom/apr.h      | 4 ++--
 sound/soc/qcom/qdsp6/audioreach.c | 6 +++---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 sound/soc/qcom/qdsp6/q6apm.c      | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h      | 2 +-
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 78e72379a6e0..ea7f83916d8d 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -123,10 +123,10 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpr_alloc_port);
 
-static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *pkt)
+static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
 {
 	struct packet_router *pr = svc->pr;
-	struct gpr_hdr *hdr;
+	const struct gpr_hdr *hdr;
 	unsigned long flags;
 	int ret;
 
@@ -139,13 +139,13 @@ static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *p
 	return ret ? ret : hdr->pkt_size;
 }
 
-int gpr_send_pkt(struct apr_device *gdev, struct gpr_pkt *pkt)
+int gpr_send_pkt(struct apr_device *gdev, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(&gdev->svc, pkt);
 }
 EXPORT_SYMBOL_GPL(gpr_send_pkt);
 
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt)
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(port, pkt);
 }
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 6e1b1202e818..58fa1df96347 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -191,7 +191,7 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt);
 gpr_port_t *gpr_alloc_port(gpr_device_t *gdev, struct device *dev,
 				gpr_port_cb cb, void *priv);
 void gpr_free_port(gpr_port_t *port);
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt);
-int gpr_send_pkt(gpr_device_t *gdev, struct gpr_pkt *pkt);
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt);
+int gpr_send_pkt(gpr_device_t *gdev, const struct gpr_pkt *pkt);
 
 #endif /* __QCOM_APR_H_ */
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..c84e098230c6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -579,10 +579,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
 			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 
-	struct gpr_hdr *hdr = &pkt->hdr;
+	const struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
 	mutex_lock(cmd_lock);
@@ -622,7 +622,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 89f172aab8c0..6262b9251440 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -844,8 +844,8 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
 				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 44841fde3856..3527ad1acbca 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -29,7 +29,8 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+			uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..a39f6046f886 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -138,7 +138,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph,
 int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
 			       unsigned int dir);
 /* Helpers */
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
 
 /* Callback for graph specific */

-- 
2.51.0


