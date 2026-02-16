Return-Path: <linux-media+bounces-52860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILXTFe35kmlx0gEAu9opvQ
	(envelope-from <linux-media+bounces-52860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:05:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1906142A5C
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49E13300753E
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 11:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D83302767;
	Mon, 16 Feb 2026 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAg9yyJp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGijIqag"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56792F12C6
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239900; cv=none; b=Ky9ddI4csEUDH++qYda5bNvcU8w4HQHfzul8hQvnxgunFtfM8ung1CefoCBSqqdSViNtK6SYZQIaBrcNUi+z+QxvlnO2+Db1/hphH3eyQnhmmQqi5QyUuh6yaMUcd/4ZwP6Sx5prid/V+ayEEiP9SXyAn8cN2jUkJo2S2FEy/h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239900; c=relaxed/simple;
	bh=uFLzZ/OpOze42lfs9jzKcryGN6NcWAmvBOPQSyaCvIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJhQNGW2Y0LLrFzL5YzyTaMNpfmQYchdjV3MdymVGD+meH2wcD4r3HAhPHe9wZ1R9duX1hGhWJWeDeTMslDnaKSvBWFBWLf/0xFT2mE80KLCRi5qgSWUZzm1H1ATkHJR0r0OHk3W6s6sUewgynDUI2DvV8RBqND+d/PR4otL5KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAg9yyJp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGijIqag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8geKC2803486
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 11:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLeGWuVUYOMsAivyCeX9pczLMdB6yClRRgLlfmsVrLs=; b=VAg9yyJpz0GtCpj4
	56SENzt5ZkKUkybm4QBzTYyX2C0zom5mYqe3Z2N1mccX87UznNB3RRg2OW+48H68
	pK+8qiVWNWp6QakFfrHbyI3xzHlRT51kgj2TRCiCv956eWnooEMQkU4cWZCYcJ1p
	IiByB5C8QIhuftgP1INSPW6x7oa1bLGXRN/QE6T7pzsQu4cWYVrXmvXXwKb0eXTJ
	zzoXCR9DzKLrmk9JyyGfGwejojGR0Ha3J/49uKBU+at1gaz7FDNGhB6CxxzOyo/r
	2tmWuHkDgpNl3NXC23D2GfDgVZZBn9VtZT+wyJri6DxCF2OfERafuOyPV5oK4EP+
	qn5ahg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxugbuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 11:04:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946c23cf90so23035966d6.1
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 03:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239898; x=1771844698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oLeGWuVUYOMsAivyCeX9pczLMdB6yClRRgLlfmsVrLs=;
        b=FGijIqagrca9mpjMWhXWqWXM4e9QDrEoyDX8MmBIiFXb0Z+tNKOhdhGW7PM///0Nkf
         AzhMI/7Tf2YsslWTcxPQM7mdwzFxcHUgf6+9vNRPSee0cAsAzEgNhZYAKY9DL9A6ow3S
         CiW0CrLP8kIWsLgaKHeIJa+JxGjEL0M9prXqvGwtoav4e7s38eTLmJzO46gRqnhGS/bU
         +KDgNXbNAUz7vy8i6Pzk+R47nW43c1eDX6H+UKb39b+0UGsI38VpnoB3+8Kn1FUOREB2
         7f4Z6rQir3+7YlW6uA/7pmj5YP5gS/6GnfQwQYPtE8PP77dWXPBSqoc2jY++wYOr9GTC
         pllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239898; x=1771844698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLeGWuVUYOMsAivyCeX9pczLMdB6yClRRgLlfmsVrLs=;
        b=pz+1/MMlnhQO3Y78+/HGoWgq6xOJ20DyIcrwmbzdp7ypE+KKHH6Dv7sCqPkxcH3CRP
         eIBSBKJ7UY5p2N1OmdOB013WSoXNxH0JgSZARJmL5YpRhzvIKparfHnV3Pk8i4RYyCm2
         Njj74SloOwGxErRkBglgTvgvGrwc7M/AfQSRYnHAROk3IdBfKqJORSL8nzo9fMESvoIM
         tJdEQt4h+O7kp/5wGoYRNrYgQBIQydBMMEqdJbOD4oR/O5hO/bAO/gjR2pQalR9kNIgR
         4Ghs+B16eBfNMX2KaEQFsyJWx//Nw+TQmYH6WR54qctroOSfWqEJyuYT0Oq0DdnH+NuB
         l9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4ntjaaNDWriLAwG1YE9QCfY5zBs7Q8xOsqTGw4Xw3ZvItGrcCvCtPQD0XYBDEs9a5f7zr2yk+r+WH2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbQL7CV7ThQ2mHHBWoFXEB6NueMEZlpgmAv+y2CGATvPza29DY
	MPQP6TqOXbAeZCAxE7ii5N9ahgHdzFRBvlB+pecmfUqUU09Z/U/ACnNR7Y2FaI5yRNmoqLZR90d
	5fHGcmLCylllP2/6SWw7te+GyAFu3SRI7vjG9KyVQflM2Nr5GZja61fiBjc05NG87fQ==
X-Gm-Gg: AZuq6aJaP7qidlmj7+ZZG99iWc+dhX0cR1MSzAl/8JNQ+j+oQnJHMuL+jb2RSpgRzTo
	EuNT5OYGDlXpeZdYHzu8L51mEOuNN+jLdor8+nDgfUpAznuEBDtNrM8bVwqQSeBmgwh2m6Pgwx/
	JWdgDlCQS2zSCTdcnBKD5WWNFY2pEEyZ4Zypfxh+XIFJsBuN9njZ/sa+40QayBYbQe8cDvtCIEj
	vjxYh9RkkM7cW41FqqoNDTS3ZvIW0Lt7Y27149rtkrT6FNT70Fy4P8Smd94BxPlWGJ/8imHISuR
	BLdq9iToQbuXrG8MlT6VO6GSndNVwd9tB7eybEKDBM8EBdM8aPiD+2XDTbyJk7Ryr0ublA1X4wd
	LI6sTsud6HhvFhoZvGtz3GDgNtEQWM6+xC813yYp8kS9NjZzGo3maCsAeQUZmbICIZFBpbeQBLB
	lr6qE=
X-Received: by 2002:a05:6214:55c6:b0:894:a36b:f7df with SMTP id 6a1803df08f44-8973480967fmr98228136d6.8.1771239898050;
        Mon, 16 Feb 2026 03:04:58 -0800 (PST)
X-Received: by 2002:a05:6214:55c6:b0:894:a36b:f7df with SMTP id 6a1803df08f44-8973480967fmr98227796d6.8.1771239897540;
        Mon, 16 Feb 2026 03:04:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7629b56sm255173966b.37.2026.02.16.03.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:04:57 -0800 (PST)
Message-ID: <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:04:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WQRR7e-Ka2TZM1zsm_DkRl5gD37eV68Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX0yjl6arnBLbp
 Qfb0GcFjuAFQ95FUwOTAOtEqAr3nv5UYtxGwJh8O5yIkRb2JWPNVmBbuo6XPzBi/ZEdNnQJJIpm
 vLuloTlWKnxlG9Eo2WlBz2uX/zi7FxSsssjDJN7PJHXQGEBq71pM5oqvMKClGXTuakVCqQaGSHn
 RYD7EU8656b+mnvc0yhQ3A+9YXtnHSJCcbBJ4JwejxF4AXtCkepnOMixfOd3CaFeCyX+7G5/WYf
 mZurIWkjWi+BKGNAZawMt3+mtyjipstI3AAFVyO2f38rHG6s1RpIq3yAT2c4WFqTnakttr18g6q
 t4GuwpnFJibxPHpb2ddWDFp9DamFibRlr47PthVNa71KwwFuByxoDTV43je7VxPXzlwvkf7VJFN
 2OXnPxeHxHgEe4fHTVSxa70tMgZpflIiQfNQBc5tDWs05F3zss0Bhw7I4fxAJ6uVEyTl2zPhXLK
 K7f3eghKU7PkGV6z/qQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6992f9da cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=z6PqFfQUvjP8iauf7AUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: WQRR7e-Ka2TZM1zsm_DkRl5gD37eV68Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160093
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52860-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1906142A5C
X-Rspamd-Action: no action

On 2/13/26 2:15 PM, Luca Weiss wrote:
> Add bindings, driver and dts to support the Camera Subsystem on the
> SM6350 SoC.
> 
> These patches were tested on a Fairphone 4 smartphone with WIP sensor
> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
> far as I can tell.
> 
> Though when stopping the camera stream, the following clock warning
> appears in dmesg. But it does not interfere with any functionality,
> starting and stopping the stream works and debugcc is showing 426.4 MHz
> while the clock is on, and 'off' while it's off.
> 
> Any suggestion how to fix this, is appreciated.
> 
> [ 5738.590980] ------------[ cut here ]------------
> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'

FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
and keep checking the hw state)

+Taniya would BRANCH_VOTED be fitting for 6350 too? ^

Konrad

