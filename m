Return-Path: <linux-media+bounces-53656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C7yKwg/oWnsrQQAu9opvQ
	(envelope-from <linux-media+bounces-53656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:51:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 188BF1B3838
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69A91313EB96
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2506289340;
	Fri, 27 Feb 2026 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8m/RHXi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPcXuQr3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827937A4AA
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175072; cv=none; b=MhueHcttQnynqsOP0Q4223kgiFU1izeyv3FAVUgZ5JH4t7Xld8LLmbbPtkotnMjhshiMejZcZpssykDNiYAkxwaFyp4bJVUu5878jHYXxe9IM9B7SqPAlVT25kwanyCbQaWN3nS6F0b0X8g5yooHEX7PGkPnOFzSc/zIK0Kvh3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175072; c=relaxed/simple;
	bh=xIQuJSfije3VJwhLEkYyuaEgdsMUPwPqTwYuz/rLQfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aP4V4UmF47x2JyZvqysqZnW4Fat/OXb2sCxrS9VOlSQ2Wh0fXYAsc32km7xBgfEGScVBW0KKrfw1Iypv0gM/ExVLEbXEz3hytYiICqoZ4HWsyqc4UCWSmCmBgCxPYEHEKKlv4K32m5WzeMft0ZUpKALfR1zLzR0wsNst5jQ+KKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8m/RHXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPcXuQr3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KAUd2440121
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FfMs/QXttxtUxDn1+3IMtv
	46p9e33YuxhmWMh2liEaM=; b=N8m/RHXizrn/QNEkhcBDIYhTTvHYVA0HHiwwTz
	RxIL6wzc4W5r57cgGmO2VWZYw+sEAv1tbaW/uhhEmpcOaf+K3w9QrQxk+lhurOqU
	coc3Vh0N3n2e48lT01zWmIZD6DYXg+07KOaiNU55qMr79qedTID9omHMvnibNMaO
	EjV+EDgPFfwaVtoZD1KPaUxHqT0A2L/m+4ZeI/HiasUwCm9m0Ay9fsmiuIIkRMJy
	iZYcqX0gY5Ya5+UGvVZivhK6w3MFKfC/rPhMfcsIb4gO+P/+aa3EXVp0PY1bXxMP
	P0pAqvxYRDYSpEh18hyfPeuWEr3Z7ce8/jeqiGwVPcHmH9wA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r29xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aaf0dbd073so17419445ad.3
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 22:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772175068; x=1772779868; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FfMs/QXttxtUxDn1+3IMtv46p9e33YuxhmWMh2liEaM=;
        b=YPcXuQr3U7BP9lh0E9jbsrNhF0SOUBtDUjdDwFe/K/6Wgf7syCU6fT17QdT8JC7jG3
         FkuAgiHObeECv66UjyYN1vhhn+ownlF9oTnj79C9dywcMf20hAluAkjz4VU6C43CAFXY
         QGvhBIFVAWDvhwQnv1BjDPW6d0lhiiYQIJ5Cn0UWKR/PSe4PqTiXLK7lUe5ljjv8f94l
         O5Z/U5kiUnWn0HFnx0AUuFRpeKNdVTO2B/V4d52rshG9elT14SMLchUPtr6xipd/7VK+
         k0or/8dWED2nQGdUIs1XsjjaOXGjTmLyLQDOb8JJN8j5GCoTmGzNaMtRvsjzwQXcMwZQ
         ChNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175068; x=1772779868;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfMs/QXttxtUxDn1+3IMtv46p9e33YuxhmWMh2liEaM=;
        b=R/vQ/fZIR+F6derzc8ToTl6HBmhSQD3KL0tP1wvoXXEf9eVjTEtNSWFvuL+xJSg8P+
         WsbCE350eEVXvLRIJkr5BhWVBpvqVmJ3bvnS2+QHs1WurnpI2GVjS1DwVAm9ufT7KWAP
         r+E4wtwQTJvaxhhe72hdp+IQEDvlpAS8hSiGvwc2qYA3DkZol6+F0v+0cGQuANTHJB0M
         SNA3f0fomk1+OwYJZEAjgIhWqweymJcGHp0RlspFK5sj5Gjy3a2TcUK+RF8LpufBpumn
         7wB/vNce55/CbXleM32xKxZR0Jnll3SoiTEBVdlSeAN1BZBPl10IvF5BtrLTZDYX3BlK
         ipRQ==
X-Gm-Message-State: AOJu0YykmXxcGQQsOicf1AOb/xJyu0/D/dfkqr3oiIvjyuqM23dsNfOS
	kMzX3cxGpeRlzamDwq4S7qv8egL3T3K/L7NMomSuof5VLUQ7FuGYFqDESgmuP7tF6utXq0NDdHU
	Zt3wFU3akXMcDuOH2HGa6Kp1NAGSRQZKS+syJ4qc3RZqYPitNTNye4ucRWDOPX/qU5w==
X-Gm-Gg: ATEYQzzQJ/6dmCEwntebNRuVowzO0fXQEM8RHQwXxc2NYQ8TG6OWyMCYNueNr9vNTFJ
	KwE1HtfBAXoPeGR98LSPCTbcv2fRWUeBKweD1dLDKjBLLSDZ7PRZBc32KC0Q8xXlr62+n0wejto
	CEo6buRLvOAz8A0Dwl9CnnZ7bQOH6r3qeWVWpXOmjxgy6gVMwJg9rryADMHims0XvkNSCXlfLW3
	WqKy+413Si5kxNGiYahzzA9LR+OWckXzYPGLgzdtL/s4NzDt6iIr2AJm82AeQhDTDgGhJueEBVT
	DAcjOcgfaNqiSK2f0xqSxDs/YLVn4H/CE7aRe3nB7TgKqVQqWFmrOkFfVYAYFTTe3dzPsFJi8CS
	AVkoKfNysHgqw3tKzAjYyQyisRAgBQVRssTRiMy/BoYDxmRt72S1HSSdIzVU=
X-Received: by 2002:a05:6a20:94cf:b0:394:5721:5904 with SMTP id adf61e73a8af0-395c3b1978dmr1789756637.70.1772175068236;
        Thu, 26 Feb 2026 22:51:08 -0800 (PST)
X-Received: by 2002:a05:6a20:94cf:b0:394:5721:5904 with SMTP id adf61e73a8af0-395c3b1978dmr1789731637.70.1772175067651;
        Thu, 26 Feb 2026 22:51:07 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm3455880a12.3.2026.02.26.22.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:51:07 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: qcom: iris: Add support for Gen2 firmware
 detection and loading on SC7280
Date: Fri, 27 Feb 2026 12:21:00 +0530
Message-Id: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANQ+oWkC/42NUQqDMBBEryL73UiMqdZ+9R5FJI2rLlRjsyotk
 rs39QSdj4E3MDM7MHpChmuyg8eNmNwUQZ0SsIOZehTURgYlVSGVrAR54oZtqS6y6XFSDa/z7Pw
 i7CPXujhjq7GEWJ89dvQ+pu915IF4cf5zPG3ZL/1jdMuEFHklo4zuTF7dHHP6Ws3TunFMo0EdQ
 vgCvWtWx8cAAAA=
X-Change-ID: 20260209-iris_sc7280_gen2_support-cb34465ed4e7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175063; l=15535;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=xIQuJSfije3VJwhLEkYyuaEgdsMUPwPqTwYuz/rLQfY=;
 b=MXczaUOeaodBkbaq/6bmuGoctFJ8rlcvs8Aa6sZ5MBctLXCsb72UwqdkfgDJzOS1YGPOBPl31
 yhfqFJS89vrAaJbjlznxpYP4NivUiKz7jeGsjoK75+5JakFNLJ0NpDV
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1NyBTYWx0ZWRfX9+ua/haXxm0z
 zMGCFUwxag5asNflIUNIkaKIhYa3XfKA4dvik7TvdjYoLxAeyME7hIHMH/wzwr2b4a41bhf2nhM
 D98BNAy661DbuaBIKQy+z6+m9FzSiUmogayET42XMXi91iqV4sHIzixZ7315opRiBZVYK1YZs//
 J94Zd1hUXWcxkYYlhsjyajjbiC6Le+oF8+i8C16zGSRXtX35BhDUB2uzwjtWkgaIffm2yU22haE
 2yk69xa5CC/q2X1N3WPOO4lQ32osScJsBwbCl+AeTSh00jLSoQTvJHga/WefES1eOc3yG+J9kpz
 aAjcJHWzAcDk8FSTFwlNm2Q0FfC31XMRXlIzrDd1/gDIxOR6M5GWbzPZy8JLdgYMwUoypdAgMjG
 O+TA54TAPbY3e35GLmsNlwKYtEqTN+Q+72OqwuMcqgARPpwyIPb+k+eKqfYufG7agxcEV7asNub
 4H7SwiLbudpwvjjQAfw==
X-Proofpoint-GUID: 4XKI92qkQtLshc0KyAXeXtYQnV4k_p-j
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a13edd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vAhLNi6rj8_hoSnI:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GhrRDr_SA6QW1ZK_kR4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 4XKI92qkQtLshc0KyAXeXtYQnV4k_p-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53656-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 188BF1B3838
X-Rspamd-Action: no action

This series adds support for running the Iris driver on SC7280 using the 
Gen2 HFI‑based firmware. While SC7280 hardware is capable of operating 
with either Gen1 or Gen2 HFI, the driver has so far only enabled Gen1 by 
default.

Some platforms may choose to deploy the updated Gen2 firmware. To 
accommodate this, the series introduces logic to detect whether the 
loaded firmware is Gen1 or Gen2 by parsing the image version string 
embedded in the firmware blob. When Gen2 firmware is detected, the 
driver updates its platform data accordingly and switches to the Gen2 
HFI configuration. At present, this behavior is enabled only for SC7280, 
but the detection logic is generic and can be extended to any SoC that 
supports both Gen1 and Gen2 configurations.

The series has been validated with both Gen1 and Gen2 firmware paths on 
SC7280.

Note: Patch [1/3] includes a fix for the GDSC mode switching issue 
described in [1] ], which was encountered during validation with Gen2 
firmware on SC7280. This patch can be dropped from this series if the 
other series including the same fix is merged first.

[1]: https://lore.kernel.org/linux-media/20260126-kaanapali-iris-v1-4-e2646246bfc1@oss.qualcomm.com/
 
v4l2-compliance results on SC7280 with Gen2 firmware:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

compliance test for iris_driver device /dev/video1:
Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
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
        Standard Controls: 38 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:
Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
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
        Standard Controls: 12 Private Controls: 0

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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

Fluster results on SC7280 with Gen2 Firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
	- BA3_SVA_C
- Interlaced content is not supported yet.
	- CABREF3_Sand_D
	- CAFI1_SVA_C
	- CAMA1_Sony_C
	- CAMA1_TOSHIBA_B
	- CAMA3_Sand_E
	- CAMACI3_Sony_C
	- CAMANL1_TOSHIBA_B
	- CAMANL2_TOSHIBA_B
	- CAMANL3_Sand_E
	- CAMASL3_Sony_B
	- CAMP_MOT_MBAFF_L30
	- CAMP_MOT_MBAFF_L31
	- CANLMA2_Sony_C
	- CANLMA3_Sony_C
	- CAPA1_TOSHIBA_B
	- CAPAMA3_Sand_F
	- CVCANLMA2_Sony_C
	- CVFI1_SVA_C 
	- CVFI1_Sony_D
	- CVFI2_SVA_C
	- CVFI2_Sony_H 
	- CVMA1_Sony_D
	- CVMA1_TOSHIBA_B
	- CVMANL1_TOSHIBA_B
	- CVMANL2_TOSHIBA_B
	- CVMAPAQP3_Sony_E
	- CVMAQP2_Sony_G
	- CVMAQP3_Sony_D
	- CVMP_MOT_FLD_L30_B
	- CVMP_MOT_FRM_L31
	- CVNLFI1_Sony_C
	- CVNLFI2_Sony_H
	- CVPA1_TOSHIBA_B
	- FI1_Sony_E
	- MR6_BT_B 
	- MR7_BT_B
	- MR8_BT_B 
	- MR9_BT_B
	- Sharp_MP_Field_1_B
	- Sharp_MP_Field_2_B
	- Sharp_MP_Field_3_B
	- Sharp_MP_PAFF_1r2
	- Sharp_MP_PAFF_2r
	- cabac_mot_fld0_full
	- cabac_mot_mbaff0_full
	- cabac_mot_picaff0_full
	- cama1_vtc_c
	- cama2_vtc_b
	- cama3_vtc_b
	- cavlc_mot_fld0_full_B
	- cavlc_mot_mbaff0_full_B
	- cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not supported by hardware).
	- FM1_BT_B
	- FM1_FT_E
	- FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
	- SP1_BT_A
	- sp2_bt_b
	
./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
The failing test case:
- 10bit content not supported yet
	- DBLK_A_MAIN10_VIXS_4
	- INITQP_B_Main10_Sony_1
	- TSUNEQBD_A_MAIN10_Technicolor_2
	-  WPP_A_ericsson_MAIN10_2
	-  WPP_B_ericsson_MAIN10_2
	- WPP_C_ericsson_MAIN10_2
	- WPP_D_ericsson_MAIN10_2
	- WPP_E_ericsson_MAIN10_2
	- WPP_F_ericsson_MAIN10_2 
	- WP_A_MAIN10_Toshiba_3
	- WP_MAIN10_B_Toshiba_3
- Unsupported resolution
	- PICSIZE_A_Bossen_1 - resolution is higher than max supported
	- PICSIZE_B_Bossen_1 - resolution is higher than max supported
	- WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
- CRC mismatch
	- RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
	- VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 235/305
The failing test case:
- Unsupported resolution
	- vp90-2-02-size-08x08.webm
	- vp90-2-02-size-08x10.webm
	- vp90-2-02-size-08x16.webm
	- vp90-2-02-size-08x18.webm
	- vp90-2-02-size-08x32.webm
	- vp90-2-02-size-08x34.webm
	- vp90-2-02-size-08x64.webm
	- vp90-2-02-size-08x66.webm
	- vp90-2-02-size-10x08.webm
	- vp90-2-02-size-10x10.webm
	- vp90-2-02-size-10x16.webm
	- vp90-2-02-size-10x18.webm
	- vp90-2-02-size-10x32.webm
	- vp90-2-02-size-10x34.webm
	- vp90-2-02-size-10x64.webm
	- vp90-2-02-size-10x66.webm
	- vp90-2-02-size-16x08.webm
	- vp90-2-02-size-16x10.webm
	- vp90-2-02-size-16x16.webm
	- vp90-2-02-size-16x18.webm
	- vp90-2-02-size-16x32.webm
	- vp90-2-02-size-16x34.webm
	- vp90-2-02-size-16x64.webm
	- vp90-2-02-size-16x66.webm
	- vp90-2-02-size-18x08.webm
	- vp90-2-02-size-18x10.webm
	- vp90-2-02-size-18x16.webm
	- vp90-2-02-size-18x18.webm
	- vp90-2-02-size-18x32.webm
	- vp90-2-02-size-18x34.webm
	- vp90-2-02-size-18x64.webm
	- vp90-2-02-size-18x66.webm
	- vp90-2-02-size-32x08.webm
	- vp90-2-02-size-32x10.webm
	- vp90-2-02-size-32x16.webm
	- vp90-2-02-size-32x18.webm
	- vp90-2-02-size-32x32.webm
	- vp90-2-02-size-32x34.webm
	- vp90-2-02-size-32x64.webm
	- vp90-2-02-size-32x66.webm
	- vp90-2-02-size-34x08.webm
	- vp90-2-02-size-34x10.webm
	- vp90-2-02-size-34x16.webm
	- vp90-2-02-size-34x18.webm
	- vp90-2-02-size-34x32.webm
	- vp90-2-02-size-34x34.webm
	- vp90-2-02-size-34x64.webm
	- vp90-2-02-size-34x66.webm
	- vp90-2-02-size-64x08.webm	
	- vp90-2-02-size-64x10.webm
	- vp90-2-02-size-64x16.webm
	- vp90-2-02-size-64x18.webm
	- vp90-2-02-size-64x32.webm
	- vp90-2-02-size-64x34.webm	
	- vp90-2-02-size-64x64.webm
	- vp90-2-02-size-64x66.webm
	- vp90-2-02-size-66x08.webm
	- vp90-2-02-size-66x10.webm
	- vp90-2-02-size-66x16.webm
	- vp90-2-02-size-66x18.webm
	- vp90-2-02-size-66x32.webm
	- vp90-2-02-size-66x34.webm
	- vp90-2-02-size-66x64.webm
	- vp90-2-02-size-66x66.webm
- Unsupported format
	- vp91-2-04-yuv422.webm
	- vp91-2-04-yuv444.webm
- CRC mismatch
	- vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
	- vp90-2-21-resize_inter_320x180_5_1-2.webm
	- vp90-2-21-resize_inter_320x180_7_1-2.webm
- Unsupported stream
	- vp90-2-16-intra-only.webm

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Changes in v2:
- Improved the logic to detect if firmware loaded is Gen1 or Gen2 (Dmitry/Konrad)
- Added a patch to switch hardware mode after firmware boot
- Link to v1: https://lore.kernel.org/r/20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com

---
Dikshita Agarwal (2):
      media: iris: Initialize HFI ops after firmware load in core init
      media: iris: Add support for Gen2 firmware detection and loading on SC7280

Vikash Garodia (1):
      media: iris: Switch to hardware mode after firmware boot

 drivers/media/platform/qcom/iris/iris_core.c       |  6 ++
 drivers/media/platform/qcom/iris/iris_firmware.c   | 70 +++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 10 +++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 --
 drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +--
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +
 15 files changed, 218 insertions(+), 33 deletions(-)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260209-iris_sc7280_gen2_support-cb34465ed4e7

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


