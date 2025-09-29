Return-Path: <linux-media+bounces-43317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB8ABA8772
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 10:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA9016AAB1
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 08:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F08D2BF015;
	Mon, 29 Sep 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cD0sNuFV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F1327E06D
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759136037; cv=none; b=UmfYVow638NfL7dbPInxOROsq4T8C2dDr9geo0l8Rv4xRYZF3qScRQ5QMsqPYE1QGgNKBYYmBt8sSfQNXdjyhhF8gqZd9ky5ycjtXjtFq9qbasa0LtQHrxPHHRyd499OLHk0X6j5PLWCTLrvR24Dm7XiJgVE67bkgs0gpTYoKIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759136037; c=relaxed/simple;
	bh=R7BdmZgGTbdZfx8EcUuOrDncdMcGmRVH+JIXn1G/oLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pc6UZoLmACvpeus04e9GimhE2c60s5v7A8dgQfvpZ8ie0W7I84mMdtx40MNHqOHnUlxyPwGBmGX2x19OzDcOuo+sxG4DjuTUAJBLVFFXlX7rum3fg1BrMKWi9XbNM0qTFlkiTLniL2bJP1j+pYXR+nXkKxxBkdbImG3epPcO2fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cD0sNuFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SN9WhT011761
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 08:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7BdmZgGTbdZfx8EcUuOrDncdMcGmRVH+JIXn1G/oLY=; b=cD0sNuFVC2Q5FHs9
	BMnBlwSDxTWRi9aCZfSzPKvDpgCeHs49SO1uh86bOF8hVGPzPVd3vHWERnMGVrtj
	TsTbpFeENNbE9ZECfBhRbrQ3mAytjl9446q5uW5dXACcgFVfRg7ZX7+s5+IDEIQi
	9OX68idSS9P7chbxX2TooLkGPpAFsBgJt42lKD7MWiVEIYU4mKFrDiTK5xOqMEmG
	T76GK9OcN/S76OM+s2s8f25b2rqrQheTPntzl6+0bKf/Ka66M5bNacHcb/bIhE7R
	S1lqBMDlbeZRLe9sK9j7SdFEWIfufXU709SwpPZirJHo2EytxlIB8FLrHRtgyKT0
	RgBZkQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqvjq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 08:53:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7916b05b94bso129182416d6.0
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 01:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136034; x=1759740834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7BdmZgGTbdZfx8EcUuOrDncdMcGmRVH+JIXn1G/oLY=;
        b=WWWRTnJyJi5UfKo1bGLCjdiMNnRs2xwdAoTPTX9QaYXRYFiZPIzaXBFrubDcWjknv2
         i6mNzt4hb84jBjzEkpqUQd6Ri4Dl7m+Yn2Z+jc2eqiASeB05VDu3PH0jUPtKiPOwcMyP
         X+5HpcY49eme9JcAKDkhz6at8KUvdhaRwYiXJ8ygrNQwGFHz0+jb8TFB7i7YWXZ5etpF
         HwOkxiYQTtp9SF8RzRB5sKkA9hF0GRfUbMPZOnvjg7L7oPxYCGXvnBv+HD1OwUDH4Xau
         qKfq1eRqV5R6KEdiI+l9PYWo6xI51CvcXxie2LMxFujPiKxBTxzJ7iEXXz3YLxjX3kTf
         P1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCX75ZnYFRmG8HXEKo4BXFXT9FllFdMJ1b2yyJ/gmyRGG1Iar1HsujZYd0el4nRqFqLkJPp3O0ppqDbDMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpzxPHDhL7Gj8XeLoPT1+9GmPXYqBqRz9PuhpPcdsRxxUzIxf
	I9tXvS1U13lmVzzLX+RE8Rj5LdE3jxYMjKjn8UGoyCjr13QQTWBBdzSDGfnjTQrlbWG1F369RLH
	dA368+QFCfGn6kg9XfwHycJGXixH2eiB+PKT4iID/8jUYlv7zcrwqSZkixdk1NsUJp19pIoPqvG
	wcWqPQ+2Wh/MqTYFR/ScWcMcjAel8gP/V0C9KjMMUD
X-Gm-Gg: ASbGncs2J9dJNC0Y/qvyDMfl7Hg+LzL5ptk6oVtUcimKJbLsNOOZ2Vz8//Up0ArnqdZ
	m5ARv+2VNYrj/7jIzGDMO3SjWSh9hsXSugCgLQbeXEvVpexzS7MYkyZwGzApetQ5BvCFDbsgJxP
	WjZq4HuHFELP3k3FKdv4THF42sELV6G2OFvp8umjZxqH1+7Sj09tO+oNU=
X-Received: by 2002:a05:6214:411:b0:7d0:341f:148a with SMTP id 6a1803df08f44-7fc3aa707a8mr169289086d6.33.1759136034076;
        Mon, 29 Sep 2025 01:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE7+++gueAWVbcIWzNugbC5NemFua/qTKa7w8VJdZEmfCrc0HAv3aQj1V7qkKv/arj7Jri3xWs8memUSFsccU=
X-Received: by 2002:a05:6214:411:b0:7d0:341f:148a with SMTP id
 6a1803df08f44-7fc3aa707a8mr169288896d6.33.1759136033411; Mon, 29 Sep 2025
 01:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-2-loic.poulain@oss.qualcomm.com> <0bfc50c3-2df7-4e7c-a6b7-99b8e56a65ea@linaro.org>
In-Reply-To: <0bfc50c3-2df7-4e7c-a6b7-99b8e56a65ea@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 10:53:42 +0200
X-Gm-Features: AS18NWDWFNifGO0pEvmy4HvdAyPW7WJ3Wi0YNtbMTnTSHZCFCSZ5-ItZzCp9W10
Message-ID: <CAFEp6-0nja15oSEhm=ZjJb1g2MgM8Vv+fPdDgyghFNestf_t4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 0DdXREh_EEQks6RkQtjHLJ5fGriDtfbh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX34YZE92DawMV
 rdCc4cHyAbdcwtPqkSyfUGGSSvol2Ry4seShoLDSAntTSfVg/bWXZuCELxGZj01Puc36Vz2RKi9
 +bWi0sltIgPCKSSEtFrwhHQyOblsoPKp6QcYbbb8+o9Oq6xFZquV4koJpRo7v5+wvLIG6VASHTb
 +krXiM2rbBOeIrBq7HeHJ+1MJSzW3vJITRtTHnZqhgj9PZLzzFGxPWdfQz2/aThGJLrGqQXp/b9
 P8dh8kOHpzSN0qBl9GrdAw/fqcpGcddsbsy0C/w6qoyxHxVuVuyOrDjrc0D8Pamr6tZMTgQyQcu
 p+cjeyCBm2SLR3O+GBF5xHn+sTURs4kiXRnSek/3hUhncvrVu+gXrlhoEUtS0TZ2piQ7Ntl1ZQH
 XjBk7vcv/Nv6D1GvF91JnLRCcd0bjg==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68da4923 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=y2W2zGIOAgzQDGN_av8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0DdXREh_EEQks6RkQtjHLJ5fGriDtfbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

On Mon, Sep 29, 2025 at 10:46=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 9/26/25 10:34, Loic Poulain wrote:
> > Ensure reset state is low in the power-on state and high in the
> > power-off state (assert reset). Note that the polarity is abstracted
> > by the GPIO subsystem, so the logic level reflects the intended reset
> > behavior.
> >
> > This breaks backward compatibility for any downstream dts using the
> > wrong polarity.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>
> I kindly ask you to specify the intended behaviour in the documentation
> Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml

Sure, I will add this in V3.

Thanks,
Loic

