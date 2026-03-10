Return-Path: <linux-media+bounces-55078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JPCL4EAsGm0eQIAu9opvQ
	(envelope-from <linux-media+bounces-55078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:29:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BF624ACCC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 597D1302AACC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 11:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822D538759A;
	Tue, 10 Mar 2026 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvNdvUYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTKRWggq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A4387343
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141769; cv=none; b=pDnBELNGcLktyT4pUsXutECq6IYMAaWH5SEQWqe0z/bSAydU6k+iRpbc3VvxHpoqOUuFoHk3KA+ngxXbSK8XBrMZegaPcAkKARDg/5o3qMCU/TGsELR3U9hrDKEA/Hir/EBPBYI4GT3wHeHlWeD5r7xQZVuins3a9RLgY7B8PcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141769; c=relaxed/simple;
	bh=/pYcuf75vG0mfIhpRZR934R9rutW2Spwx/s55qT/NGM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WpdfSKcM+Zsju3j8toVpJy+L8O2vk0PoUEJ+LdZo+F2WBfCwPyOnlc+Ics5CWuj09VRGenytW49YYTKcCg/Zjr7JLlRSSYqiIrCky4jidCWGbGsiFNZKKfXR3FhjFlFwiMpRqJc+c8GeRMqKpG268qDZx6zQ6DbbkFzNTtfoBG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvNdvUYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTKRWggq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8hLN32754437
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y/qwFBVrh28l0ZkfnwX7cS
	s5swrg6QXLtTG7HCt/bKI=; b=lvNdvUYVrWfemxq61pdGbHF7drp9x+Bp8VAQNn
	3uVWzG/PYaJoffXDdLU5DovvKKcOOhI5R1dlSrBXucLfOrCdIDkbvnquMMzBJoZM
	/ZX3biQPyhWUB/C67MeeQMytvSEHXTynFaIJGmSD/Ul3PiviEbs1rYyyinB9FsKL
	c8DHwmkiMXNy1Q+SOLb2oeRQiotDRy4mlRSyvoXARrrPH0T+wR/iV8XNzONGazbg
	zFxvJd6TeWEvj+eUombbAf1uDY1rqmkeEpjlR3RadusEQvN5KuRlawCAv9yB+21s
	9zhg9xi0xrteftGP72y7xrl7n5v6QT1NP1Mf4N/afUEKnJOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrmek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81ce6fdcso2375087785a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141766; x=1773746566; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/qwFBVrh28l0ZkfnwX7cSs5swrg6QXLtTG7HCt/bKI=;
        b=cTKRWggqbIRt/fIqACXHeZoy6JzuLF34pxJlbnLYTZNE6xkezgKGbRUxYi68hVtGot
         qLe3Y+MRhwglYWs//cXxpavTeSOBZCEd3Pvv6vtpK9RVgUv9nUsvA9dMicfTYNjoMtgE
         PfI74j2rNBmYy6YbupiOjJDOq04n7yNLqmGd26qUFMWQuVNDzTmHzAmmL/PUu8Muo8w0
         v2cAzhI5Ao0gTlKYy92yCpn3R8YgLU6VZz6vxfgTyO0nUQVSqmjSVx+grRoMqnhMHRAo
         +gsVlMpRqvbnKgCbI8lbbsxHwAjcCIWZck5woZs0KmzLjXPacJ6wJUmYIVD67KqBY828
         hmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141766; x=1773746566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/qwFBVrh28l0ZkfnwX7cSs5swrg6QXLtTG7HCt/bKI=;
        b=v29ICl0uhd1OtO5F5zjxtHVAluMA8gKsBK4VI2eFH6KGRxqH1Usq5E+f5s9asBamNC
         GLMeftpPfeliH2+7VRy/a9gQPN0nrrSDWDxuc0pjx5sZtk9BjvXVcmoDxiOxFo9IBwRc
         xmnJpiJ4EfW82eXeYDA5n8v0QqAtQJ4jh2lcpOwWN+GaKpEMmBqhjF4JcLCose8hgp61
         y9PH70Z8DHuanBswAHFjJpfOoenF0BGXOBnTe+2sx5LEMfMZHTvuTeEWd4XJxzFv7lOG
         Xmk5zwNSWhOxDp4ZwdqVsRnHOQy+m9QqhHd1MAYbUfdb96bWaaL4jVdXNm1m9EWNu6AN
         ja/A==
X-Forwarded-Encrypted: i=1; AJvYcCVTQgoI5IaW1ndNjRnF0A7vjzpuMXgIARF8mhjYTUnKRlbZh0eXRuZy5Y5inx15iYM+/CPx9H7zjFaa7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyDHvTX1Yjm2R2QkXYtdhe7HgtPT9Y/mxFCVpYFLyFTIUNJTG
	x5UBEQ1Lue8tGSOtR3094mCVWCR+icqzVojrQ3NPY6ENab+LSf/vq3gfuyKDpF3XOm+KrpBHKWy
	3Jk9DLXrNJY3ZpPjt3gr5Hc5dLMzMv74oiY73Pc0MMn2PhYBwrBf+pdNsb7X3dElPRg==
X-Gm-Gg: ATEYQzzJ1mF1sXsWePK9EsOHieHDapbLCSavLhEr+KnmH43VTSPGSLWIhmQzvKJX5uG
	8JnS9CVmzVgUqsIAVGH/pzuDi6j4z2NooHp8X7ypjlk0dR+g3XnBhj7DDPDZs2pPkutznxJr9t9
	T53lre4ZNYaIvrTOKDbWgtFMrTO+dUGP/WSFrwBaA81K9sPbJfM6qZrToaXV97+tKuxcgufEEIy
	typ8RtXaiZg5kCzH0LF18rjfmhLtDesuTpSSJvZmUQ4XEl0WYeaugby2+tJQ/ZZOd+eOjf8E5a1
	5bqqxS79lnXz2PNzqTth3uS5XxeH3wERmu0TnRlp+hbDth3kXrj8XqzMoT5e3vI1d69xdXT9MFh
	G/VJuf3CdzDnIRnRSwYU1ZHSKHa48cXG7sX1KH2Xo8mSn
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cd937f17f2mr356170485a.71.1773141765998;
        Tue, 10 Mar 2026 04:22:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cd937f17f2mr356168585a.71.1773141765602;
        Tue, 10 Mar 2026 04:22:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Date: Tue, 10 Mar 2026 12:22:34 +0100
Message-Id: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPr+r2kC/32NTQ6CMBCFr0Jm7ZBO/Y0r72FYlHYKTaTFDhIN4
 e5WDuDmJd9L3vcWEM6BBa7VApnnICHFAnpXge1N7BiDKwxa6SPRXmEeB+lQODq0KcqEhjWdDPn
 WXTyU2ZjZh/emvDeF+yBTyp/tYaZf+0c2Eyq0LZE9szJKH25JpH6+zMOmYahLQLOu6xcm/Pn1t
 wAAAA==
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pYcuf75vG0mfIhpRZR934R9rutW2Spwx/s55qT/NGM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/79dtIL0hoBUkby2F0NZwr71kJVJLTW5zNxt
 HtKoGbbYoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/QAKCRDBN2bmhouD
 15aeD/0VT/T+e0k9st+gQW6YoLj391NXIaXPNdoizXWVYj9/m8VnvPzI4yWwLMZsyS4/u61yLYq
 17S5OEBQH+HVgrvKu9pBPYqFSQritNf9G/0hvOt04+KwKqlJzlBO9QR/2B2woU52sh4zcJ6hWYY
 cUpbshSq0bZsyO0OipVEbiYeWj6PIt0zKKi+mlf4TxbWMlX6pOUb2tKHUU/0c9v0BRNf/fZdKEj
 FQsxLzPgtHel9lhGJfsXDg2fyRpH/lrDNJ242Qu33xAQHP9Qa7/vx0/2GstXZ4f78qygz08Ound
 vR5ygwsDxAy8TveduE6uUXwbcytKBb1TXVbZBLYPaT95ssmFWQw11DvI+HpeNfnv/liVxY8NMzf
 GRab+WoELSC56zeid4QTsbVDSutmUwUdpsgtLXWgIEsW7DrDVrB1BRWq72Lgx6/nP66q43Z/mXE
 iTvTtgSmIF/OBXILTMAI99Q0tWvUNO/lMEDhaXEa9dqguwcz41UvtSRGFQgJ1O0AKp/m9t0i3Cl
 udGIQbKOUUncPTAupcq2h4sVQqMTaVlhQTNRmuW+FKT609sOptOyTiiOpMILV+DV752BUVBuFVh
 cnQ9Lj4MqQkPwFzyRWkaOE3b/j6SL5bY2SOdbomLdssxtTYpemKhI/FdhWV3oSlwm7uXtOndqj3
 s6tshYhHpVQAJZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69afff06 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vNCZscE_9IHIdu0JSTEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: JmFvOFPjWFbSOVD502cTHNIpXSr4w_Wi
X-Proofpoint-GUID: JmFvOFPjWFbSOVD502cTHNIpXSr4w_Wi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX6IkH87rpNSK7
 rzV1PcT4Wkwc3iIsL49wnPCtXL6C9U8w5Lk9m2dBjLAePIPIMLeYvztoadp5QLgltctIz+pweav
 4McsyBxqksGKtgspwsZYRjxhXiQ9IiC3ifgiTWK5IXGm6q60Q/c1serYpLwm40EVRxCa48OLVWf
 bml/dLYSKkVq54BuLS8Uxb3YeGxIg9Mebbg7yIsyBMnpejKitGVVa5opBXxzoo6lfB+kPTpMf97
 nd30AqqL5ODTqq0GuBRB7guzstUYMxssPKGElf8BZCQuEhXoxXluibjZisnD20BlSbfI4p5PXwj
 VbeQeB1eHKff3ncupcqn+SHVc35lCQbuwjuUz9n5WivGF/eLtTkGqmhXfEkGgn0dkoB8LT0cRAo
 3/KJLwtOqsWg09rNpeADsFlbwqJwvZPCHapo0kC+wQQfPRCeuzaEB+seXf+hheWs1cxsMzeM6WZ
 qYKeTREqgnTAPL1WZLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100098
X-Rspamd-Queue-Id: C4BF624ACCC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55078-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This got acks from Mathieu (remoteproc), but not from Bjorn about qcom
parts. I was hoping first patches could be picked 4 months ago removing
the dependencies and making things easier. This did not happen, so
Bjorn, please provide Ack so this can go via ASoC or please express your
preference of merging.

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Changes in v2:
- New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
- Rebase, add acks.
- Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface
      media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()

 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
 drivers/remoteproc/mtk_scp.c                       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
 drivers/rpmsg/qcom_smd.c                           | 10 +++++----
 drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
 drivers/soc/qcom/apr.c                             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h                 |  2 +-
 include/linux/rpmsg.h                              | 17 +++++++--------
 include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
 include/linux/soc/qcom/apr.h                       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
 18 files changed, 65 insertions(+), 56 deletions(-)
---
base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


