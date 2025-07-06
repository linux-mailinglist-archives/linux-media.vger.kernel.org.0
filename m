Return-Path: <linux-media+bounces-36708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5398AF817B
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 21:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4F81C884F2
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 19:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7502F85FB;
	Thu,  3 Jul 2025 19:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBPVKf21"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279E92F234C
	for <linux-media@vger.kernel.org>; Thu,  3 Jul 2025 19:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571700; cv=none; b=NHYiampX9qmRBVcoM9da6WMi6JhK9Td1KuBtd6Jy7Lr2Hq2hWMNb/i2fZN3lq6Ft6qRaHCQqphwUP9n/wzjV8qaSlBEDES/XCEmQlgHfb26kbJK0CvYwmTQ583bn2Pu+26lQcVQTq+dLXe90rA593g7GlCoS6KRiv7jcnqvpoqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571700; c=relaxed/simple;
	bh=FPOE9jKuRnDIN02Mfy4DiO5EeVwLdTW7RIHpVftjM7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqvVr39DlNhboTE8xkWH17MF5UShCADXRrhW6639OcWE93Fyxl7CSFcfxAMLHGFBEk2jfo/9vzsIlxqU09JjgAnSD9tzaG9s2mHi/0htVkqc+8OkfONwCx16iH3BzUmmG4BQWsHXyOdJpK3+0Htib3yyNseN4tPA+HOjm4BegYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBPVKf21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563If9qq029558
	for <linux-media@vger.kernel.org>; Thu, 3 Jul 2025 19:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	scbQQfH6Olx+AX2Mz6SJGispT1nzdVhg+8fCGiHhHPg=; b=YBPVKf21s1yLvcVE
	HKVbHDkbU62oarT9JHAZofHg5l4Ebu1cKlZmBeyZlbOQNBPME4Ixj/gV93qnhBIF
	W4HXmXnfzjR+lrG1m4M7Uzu+VH2NbYP3QZaOqxY76OZNaVR7MbTtLr+t6ooz7vbB
	K/NFlXfQ/dNcX7nOhZhIPN5BIZQp5zDrEUWDhccenPIIyUxqfukvG3naHvV/Mp6z
	9PUfCNt2z1z5WHqo5vI3okzEZw8H0WBVa/wUnIgkL9ev8akcxHkbTGxAIw9QB/Z9
	GhMDUPvpN+EQMldUqz6ta58uNkLx6EvYq2Wp4x/aqkuvy+SnobVtaMC8q//L39JD
	/7Ajag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s2v69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 03 Jul 2025 19:41:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2349fe994a9so1568445ad.1
        for <linux-media@vger.kernel.org>; Thu, 03 Jul 2025 12:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751571697; x=1752176497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scbQQfH6Olx+AX2Mz6SJGispT1nzdVhg+8fCGiHhHPg=;
        b=xPvfYORFnbi2k+ASkzNKacgQenzyAzJkZMEORhHddNtCI0L77tXy8lc0n6Kfr3fyKt
         4pYbpwzO0+BCWHCnFo5qH/uuk1VK3w+dlrW1Pqdg61FSie3AW2VtTcaKLkvEoZQcSsDd
         JQ5kwaNWoZ8iehZgeMTjokDB51/8SnJj+1jU+qPyO0fZqkVwb8i9iITeZMePFV3P5Obz
         kF5XY1uEZigTzudxbvbXbh+NbathcUlzq7Xikktj7seHT2z5a80LAnaTF0KZy4giS6+J
         odrGcsCa+ageUFDk1yCRkCu9uVUelGTXsk6EelxJoocJCzZ0LPp82UGPvCzARVOizeHO
         Vzpg==
X-Forwarded-Encrypted: i=1; AJvYcCWw0k6bmrt3n02BRBvAPn7LEqik/JbnkJ7WG0nf0ae3MwXyE6zyBBpWkwYWvI8Vip0ceO2ceoUHGQzwcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp6J/OQpoQiF/78ub4km7skNqTiU9l2V/wA6o6ZGOF0xug6uR5
	ydN7vhM3haV4EYJEMYMsNIh1jLRk1zXs6dsR2f6ygsYiqmDLOeDKXrAkMzCXy/MWEPD4JhRYHmf
	tZzO2cjzFQbG6enDEpiwhZ2c8h59ffZ4mPuquFWEUmZGS1bgOuV0GI1vKXlOUQrEHThS3uZTeMx
	TkRWFTuhVYxW1nv8OcQuEAN7NFZVbQt+0HXpHEmBHe
X-Gm-Gg: ASbGncs6zvflYDtRXQtFXdkk29tSv6H+iO5PnwKMmVfqAQ8vCr2gaB9jZTv2h/Up/Sw
	s7Vhmh4j8g6IKsDYOSbLQ+r7wYBMwK3hziwLmbbQOxFT7WYWUHcwQ3cSKmAa/cvMp/MvLdwFjl0
	Eb2g==
X-Received: by 2002:a17:902:d4c5:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23c85dc8e04mr696175ad.12.1751571697039;
        Thu, 03 Jul 2025 12:41:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSdMM36hGxI+b+XiEozqj04OgTRUcHD4LcNE5gHmbr5YV9X1+mmDTtpRX3XcV7LeOnfNTzsDfsdmUaU70Jmxk=
X-Received: by 2002:a17:902:d4c5:b0:234:d7b2:2ab9 with SMTP id
 d9443c01a7336-23c85dc8e04mr695645ad.12.1751571696481; Thu, 03 Jul 2025
 12:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com> <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
 <3aa92123-e43e-4bf5-917a-2db6f1516671@quicinc.com> <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
 <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com> <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
 <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com> <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
 <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com> <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
 <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com> <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
In-Reply-To: <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 22:41:25 +0300
X-Gm-Features: Ac12FXxlPkjtbSMWfidIdfE1-TFfsFR1i9O892MGFWb3dewCO4BWaQhnCKyQw7c
Message-ID: <CAO9ioeXBwFYL8q7x7_fHvx5YO+qyAXk4wpnfPrku4iY9yBsk0Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt support
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=6866dcf2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=COk6AnOGAAAA:8 a=3ZnU_u36HecoYpeDIg4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX8pCJPEMMVeb+
 VNL6M1KLG3LPHAYagzvzaWsorECcVeSrMXQu22g1yunYj4WMNGmk68F0dhczCx8EnRjhhbuDGor
 eoFRHcfDFTV1e7zgdliiKIAcfra1F5urDULn8wuL0xS+WATr6/29KZ3cXmjvAWrMN2WRbgg1o+1
 2rzuJAXy8vjpqZ/gTZe4mXkPoW67xaS+HBX/kI5WJi8HfqXIjFdlL4u9g4WmK3/wCc6DiCNtZag
 kgGNq887IJeZU4qfweW0CU4bEQAJjsgSnsuynrhht2j8fujc6g6pRxg+eaxyDN2iKd1bv2thyni
 OqQ+bKXI9Mj32g1FS9nXOwWQiOfkBxcWX1O/1IFMGoA3drvR4MlIGYeyAn4lgtgF74fuxLQVcQ9
 iKBAuLF9qO7EO4CldtsdAkz2jRa4euxCPZV83u+VpncFzcKIXMbddwEBK2VjZ/9ynMvRA0VA
X-Proofpoint-GUID: Zafxg2s40d-p6nOqrneUBy2tlmLuhiOt
X-Proofpoint-ORIG-GUID: Zafxg2s40d-p6nOqrneUBy2tlmLuhiOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030163

On Thu, 3 Jul 2025 at 15:51, Jyothi Kumar Seerapu
<quic_jseerapu@quicinc.com> wrote:
>
>
>
> On 6/19/2025 9:46 PM, Jyothi Kumar Seerapu wrote:
> >
> >
> > On 6/18/2025 1:02 AM, Dmitry Baryshkov wrote:
> >> On Tue, 17 Jun 2025 at 17:11, Jyothi Kumar Seerapu
> >> <quic_jseerapu@quicinc.com> wrote:
> >>>
> >>>
> >>>
> >>> On 5/30/2025 10:12 PM, Dmitry Baryshkov wrote:
> >>>> On Fri, May 30, 2025 at 07:36:05PM +0530, Jyothi Kumar Seerapu wrote=
:
> >>>>>
> >>>>>
> >>>>> On 5/21/2025 6:15 PM, Dmitry Baryshkov wrote:
> >>>>>> On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wro=
te:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
> >>>>>>>>> Hi Dimitry, Thanks for providing the review comments.
> >>>>>>>>>
> >>>>>>>>> On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu
> >>>>>>>>>> wrote:
> >>>>>>>>>>> The I2C driver gets an interrupt upon transfer completion.
> >>>>>>>>>>> When handling multiple messages in a single transfer, this
> >>>>>>>>>>> results in N interrupts for N messages, leading to significan=
t
> >>>>>>>>>>> software interrupt latency.
> >>>>>>>>>>>
> >>>>>>>>>>> To mitigate this latency, utilize Block Event Interrupt (BEI)
> >>>>>>>>>>> mechanism. Enabling BEI instructs the hardware to prevent
> >>>>>>>>>>> interrupt
> >>>>>>>>>>> generation and BEI is disabled when an interrupt is necessary=
.
> >>>>>>>>>>>
> >>>>>>>>>>> Large I2C transfer can be divided into chunks of 8 messages
> >>>>>>>>>>> internally.
> >>>>>>>>>>> Interrupts are not expected for the first 7 message
> >>>>>>>>>>> completions, only
> >>>>>>>>>>> the last message triggers an interrupt, indicating the
> >>>>>>>>>>> completion of
> >>>>>>>>>>> 8 messages. This BEI mechanism enhances overall transfer
> >>>>>>>>>>> efficiency.
> >>>>>>>>>>
> >>>>>>>>>> Why do you need this complexity? Is it possible to set the
> >>>>>>>>>> DMA_PREP_INTERRUPT flag on the last message in the transfer?
> >>>>>>>>>
> >>>>>>>>> If i undertsand correctly, the suggestion is to get the single
> >>>>>>>>> intetrrupt for last i2c message only.
> >>>>>>>>>
> >>>>>>>>> But With this approach, we can't handle large number of i2c
> >>>>>>>>> messages
> >>>>>>>>> in the transfer.
> >>>>>>>>>
> >>>>>>>>> In GPI driver, number of max TREs support is harcoded to 64
> >>>>>>>>> (#define
> >>>>>>>>> CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE
> >>>>>>>>> and
> >>>>>>>>> DMA TREs. So, the avilable TREs are not sufficient to handle
> >>>>>>>>> all the
> >>>>>>>>> N messages.
> >>>>>>>>
> >>>>>>>> It sounds like a DMA driver issue. In other words, the DMA
> >>>>>>>> driver can
> >>>>>>>> know that it must issue an interrupt before exausting 64 TREs in
> >>>>>>>> order
> >>>>>>>> to
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_M=
SGS
> >>>>>>>>> or 'num' incase for less messsages), process and unmap/free
> >>>>>>>>> upon the
> >>>>>>>>> interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> >>>>>>>>
> >>>>>>>> Why? This is some random value which has no connection with
> >>>>>>>> CHAN_TREs.
> >>>>>>>> Also, what if one of the platforms get a 'liter' GPI which
> >>>>>>>> supports less
> >>>>>>>> TREs in a single run? Or a super-premium platform which can use =
256
> >>>>>>>> TREs? Please don't workaround issues from one driver in another
> >>>>>>>> one.
> >>>>>>>
> >>>>>>> We are trying to utilize the existing CHAN_TRES mentioned in the
> >>>>>>> GPI driver.
> >>>>>>> With the following approach, the GPI hardware can process N
> >>>>>>> number of I2C
> >>>>>>> messages, thereby improving throughput and transfer efficiency.
> >>>>>>>
> >>>>>>> The main design consideration for using the block event interrupt
> >>>>>>> is as
> >>>>>>> follows:
> >>>>>>>
> >>>>>>> Allow the hardware to process the TREs (I2C messages), while the
> >>>>>>> software
> >>>>>>> concurrently prepares the next set of TREs to be submitted to the
> >>>>>>> hardware.
> >>>>>>> Once the TREs are processed, they can be freed, enabling the
> >>>>>>> software to
> >>>>>>> queue new TREs. This approach enhances overall optimization.
> >>>>>>>
> >>>>>>> Please let me know if you have any questions, concerns, or
> >>>>>>> suggestions.
> >>>>>>
> >>>>>> The question was why do you limit that to
> >>>>>> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> >>>>>> What is the reason for that limit, etc. If you think about it, The
> >>>>>> GENI
> >>>>>> / I2C doesn't impose any limit on the number of messages processed=
 in
> >>>>>> one go (if I understand it correctly). Instead the limit comes
> >>>>>> from the
> >>>>>> GPI DMA driver. As such, please don't add extra 'handling' to the =
I2C
> >>>>>> driver. Make GPI DMA driver responsible for saying 'no more for no=
w',
> >>>>>> then I2C driver can setup add an interrupt flag and proceed with
> >>>>>> submitting next messages, etc.
> >>>>>>
> >>>>>
> >>>>> For I2C messages, we need to prepare TREs for Config, Go and DMAs.
> >>>>> However,
> >>>>> if a large number of I2C messages are submitted then may may run
> >>>>> out of
> >>>>> memory for serving the TREs. The GPI channel supports a maximum of
> >>>>> 64 TREs,
> >>>>> which is insufficient to serve 32 or even 16 I2C messages
> >>>>> concurrently,
> >>>>> given the multiple TREs required per message.
> >>>>>
> >>>>> To address this limitation, a strategy has been implemented to
> >>>>> manage how
> >>>>> many messages can be queued and how memory is recycled. The constan=
t
> >>>>> QCOM_I2C_GPI_MAX_NUM_MSGS is set to 16, defining the upper limit of
> >>>>> messages that can be queued at once. Additionally,
> >>>>> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ is set to 8, meaning that
> >>>>> half of the queued messages are expected to be freed or deallocated
> >>>>> per
> >>>>> interrupt.
> >>>>> This approach ensures that the driver can efficiently manage TRE
> >>>>> resources
> >>>>> and continue queuing new I2C messages without exhausting memory.
> >>>>>> I really don't see a reason for additional complicated handling in
> >>>>>> the
> >>>>>> geni driver that you've implemented. Maybe I misunderstand
> >>>>>> something. In
> >>>>>> such a case it usually means that you have to explain the design
> >>>>>> in the
> >>>>>> commit message / in-code comments.
> >>>>>>
> >>>>>
> >>>>>
> >>>>> The I2C Geni driver is designed to prepare and submit descriptors
> >>>>> to the GPI
> >>>>> driver one message at a time.
> >>>>> As a result, the GPI driver does not have visibility into the curre=
nt
> >>>>> message index or the total number of I2C messages in a transfer.
> >>>>> This lack
> >>>>> of context makes it challenging to determine when to set the block
> >>>>> event
> >>>>> interrupt, which is typically used to signal the completion of a
> >>>>> batch of
> >>>>> messages.
> >>>>>
> >>>>> So, the responsibility for deciding when to set the BEI should lie
> >>>>> with the
> >>>>> I2C driver.
> >>>>>
> >>>>> If this approach is acceptable, I will proceed with updating the
> >>>>> relevant
> >>>>> details in the commit message.
> >>>>>
> >>>>> Please let me know if you have any concerns or suggestions.
> >>>>
> >>> Hi Dmitry, Sorry for the delayed response, and thank you for the
> >>> suggestions.
> >>>
> >>>> - Make gpi_prep_slave_sg() return NULL if flags don't have
> >>>>     DMA_PREP_INTERRUPT flag and there are no 3 empty TREs for the
> >>>>     interrupt-enabled transfer.
> >>> "there are no 3 empty TREs for the interrupt-enabled transfer."
> >>> Could you please help me understand this a bit better?
> >>
> >> In the GPI driver you know how many TREs are available. In
> >> gpi_prep_slave_sg() you can check that and return an error if there
> >> are not enough TREs available.
> >>
> >>>>
> >>>> - If I2C driver gets NULL from dmaengine_prep_slave_single(), retry
> >>>>     again, adding DMA_PREP_INTERRUPT. Make sure that the last one
> >>>> always
> >>>>     gets DMA_PREP_INTERRUPT.
> >>> Does this mean we need to proceed to the next I2C message and ensure
> >>> that the DMA_PREP_INTERRUPT flag is set for the last I2C message in e=
ach
> >>> chunk? And then, should we submit the chunk of messages to the GSI
> >>> hardware for processing?
> >>
> >> No. You don't have to peek at the next I2C message. This all concerns
> >> the current I2C message. The only point where you have to worry is to
> >> explicitly set the flag for the last message.
> >>
> >>>
> >>>>
> >>>> - In geni_i2c_gpi_xfer() split the loop to submit messages until you
> >>>>     can, then call wait_for_completion_timeout() and then
> >>>>     geni_i2c_gpi_unmap() for submitted messages, then continue with
> >>>> a new
> >>>>     portion of messages.
> >>> Since the GPI channel supports a maximum of 64 TREs, should we consid=
er
> >>> submitting a smaller number of predefined messages =E2=80=94 perhaps =
fewer than
> >>> 32, such as 16?
> >>
> >> Why? Just submit messages until they fit, then flush the DMA async
> >> channel.
> >>
> >>> This is because handling 32 messages would require one TRE for config
> >>> and 64 TREs for the Go and DMA preparation steps, which exceeds the
> >>> channel's TRE capacity of 64.
> >>>
> >>> We designed the approach to submit a portion of the messages =E2=80=
=94 for
> >>> example, 16 at a time. Once 8 messages are processed and freed, the
> >>> hardware can continue processing the TREs, while the software
> >>> simultaneously prepares the next set of TREs. This parallelism helps =
in
> >>> efficiently utilizing the hardware and enhances overall system
> >>> optimization.
> >>
> >>
> >> And this overcomplicates the driver and introduces artificial
> >> limitations which need explanation. Please fix it in a simple way
> >> first. Then you can e.g. implement the watermark at the half of the
> >> GPI channel depth and request DMA_PREP_INTERRUPT to be set in the
> >> middle of the full sequence, allowing it to be used asynchronously in
> >> the background.
> >>
> >
> > Okay, will review it. Thanks.
> >
> >
>
> Hi Dmitry,
>
> Can you please check and confirm the approach to follow is something
> like the pseudo code mentioned below:

Yes, this is what I've had in mind.

>
> GPI driver:
> In gpi_prep_slave_sg() function,
>
> if (!(flags & DMA_PREP_INTERRUPT) && !gpi_available_tres(chan))
>         return NULL;
>
>
> I2C GENI driver:
>
> for (i =3D 0; i < num; i++)
> {
>     /* Always set interrupt for the last message */
>     if (i =3D=3D num_msgs - 1)
>         flags |=3D DMA_PREP_INTERRUPT;
>
>
>     desc =3D dmaengine_prep_slave_single(chan, dma_addr, len, dir, flags)=
;
>     if (!desc && !(flags & DMA_PREP_INTERRUPT)) {
>           /* Retry with interrupt if not enough TREs */
>           flags |=3D DMA_PREP_INTERRUPT;
>           desc =3D dmaengine_prep_slave_single(chan, dma_addr, len, dir, =
  flags);
>     }
>
>
>     if (!desc)
>         break;
>
>
>      dmaengine_submit(desc);
>      msg_idx++;
> }
>
> dma_async_issue_pending(chan));
>
> time_left =3D wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> if (!time_left)
>         return -ETIMEDOUT;
>
> Now Invoke "geni_i2c_gpi_unmap" for unmapping all submitted I2C messages.
>
>
> Thanks,
> JyothiKumar
>
>
>


--=20
With best wishes
Dmitry

