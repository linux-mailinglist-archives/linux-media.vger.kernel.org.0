Return-Path: <linux-media+bounces-33699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 952ACAC93C3
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 18:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E92BE1C20F16
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 16:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31325217659;
	Fri, 30 May 2025 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYDzNE7+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB781C8FBA
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748623329; cv=none; b=BtLrnf/K0c/4azmhO6RB5qgh3tFRpm0AY00WfzKRo2okQCh9WnF8lVcUBPXcg31Xxuo5/t4IUcftsgheH0hfSpHbFtBR4hJPhGfQq/FhhwyT9XVjGniX6K8IzsWEfWpA9qzNLsp8otsbdZAeVhGVXmMAzgg1YhlYnpFOGwNpZ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748623329; c=relaxed/simple;
	bh=k0r3jAdN0yq9usoh2WWpT1HcqWj23B9/RTpZqizK8xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViNOvELIsxs+gijW+8HjjCyUu5xP5MgJ1iHC8/5sax5Ig1jhX1Z5QONj4Z2lWbP3nVzXtbmgG3sJd5WOuJd0+lMCJDv5466fnuK5ldQKZrLGTWI/j7XPiK56eZ3g2/4oxYJkIAqmHEsge9HVFNHnmxKNK62ieMtXRRbXECh9rNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYDzNE7+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBoRLT018199
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dR7iDYHwxHQyVpZ0FR3nn7vovmsedDiyUz4cLKOAiXY=; b=SYDzNE7+O0bygCAE
	rlaLgorWaRZG5WEOWvfqnQUOYdEJO1GuvfPt9Hb91QRcE3DT1eUSvfAKAhSqNES1
	Qoou5l0Ji/ilQW4ccGpSqXFA8cGDsT6KmPwILCDbgVSyNI+skgZKvdR3f7BT+U+Q
	2+VaRzZ9qp9aEA7/KDG6fFisGYzyorWjZ0RGb1IhbRIehf+lcRAwvkcvSHYfF2cv
	8cikVvzVsf/LRiAAGUs9y7E/eVcdWe6fRAiPA8kPM3d+luxFOsY5BtFKBwz5QZZP
	BcV/lZKLJY9TqZW9q0WSVsvk7HqkrjdNiy3XVuAW3ADhOoWe/MBq8Afw0irEnyFx
	r/hmCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4yrvqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:42:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d099c1779dso320344885a.0
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 09:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748623326; x=1749228126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dR7iDYHwxHQyVpZ0FR3nn7vovmsedDiyUz4cLKOAiXY=;
        b=HDqJ9ZTLifpnuIApbpZjU5R8kIShnCfi0ABrlJn3XJAHnkxSiWcZ4R1ZCUzmXJR3F6
         wLyeja+5zUTi2rcI5p28hwwqbsQItXRkfOFEC3EjBiXlmURGu2+v+keAIoxzLltMP2BZ
         yKNMHCp5R+eP4jA2HUcmkshd5/4bP6K8nIa29Qg7GdLelioxsfBsgKQk/94l1AhPKXGY
         5E9iWLd3IErUjMl1KGgFmJDBlLpWLgyxMnHbAb6bcmvdzDJsWFS5YCGJ09QeYVZ2cSzU
         9WHFAssQpHLw247azK/Q8wZtkmXj98KISkeyb7AMaJs5UF72ZxXD/HopbIozE14pUuPz
         gN7w==
X-Forwarded-Encrypted: i=1; AJvYcCUJrvWkPjSOSkSPzADRrmAa/mEwgHqMUWSHzaYe1zXgxlAZLcPjgBL90k4ozknEqfXQAQj0H32ROny/Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqojgO9b6/+W4jQeRtMWCqA9Pgzb3Njovrpus1/0Ik5GXHX0gm
	LexD4EPoDJ2rHmprf3wU6c0tjkViHSZ/fJfoh/Sh4Kr8AyiDlg434rnodhLgPt3c1pfSZcw3KaL
	ZF0kalnKOChAPnqNTObmXJH1LLDbqLaO30Nrv1rUHAulfHNLXs8WIOvRSLl5Z1hI7Mg==
X-Gm-Gg: ASbGncszhLHAAe+EUAwGOvNSP3LpMvcpVU5KNWz8w/uKpLka/60g1LOtpSoawDdFe7A
	ktoDSBnvbpkaIIHiQgpH4Ek1rJzkjqHZqD3M4Sm4+owPgdVYForDouOex7/+9vGLpnBKKwIcAAB
	sYZ4FesXP/Z+aLkJ5uHppNFlwBeoM9cALsLV52Ig5IYcb2/z2J/Z5UdFAVrv6Nro1ILxbHhLPbe
	z0GtAMTCPMEmqUbRIsjpoQiCrE9x3LKDLuqrzo6b88E1nvm9b8YLlxtSa9EahCFTIBwjlN1+Br0
	XXaR5eucIrvGsRAS54DAKGRMEFTDEZYqE2bIaz1rgLNAvFCnjurBW/VeS0HhsGNmv5+1BHAgNpz
	vEFBK+gtFHQ==
X-Received: by 2002:a05:620a:40d4:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d0a49e7ba2mr373935685a.11.1748623325398;
        Fri, 30 May 2025 09:42:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmLJH2eYXh48Y1EMT6w54qghRK+Ixc8oH91zfHpViI5rEh5CCU1ZanUtnkUIi0JSYuzlqzYg==
X-Received: by 2002:a05:620a:40d4:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d0a49e7ba2mr373932285a.11.1748623324980;
        Fri, 30 May 2025 09:42:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd2e1dsm6556581fa.100.2025.05.30.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:42:04 -0700 (PDT)
Date: Fri, 30 May 2025 19:42:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
 <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
 <3aa92123-e43e-4bf5-917a-2db6f1516671@quicinc.com>
 <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
 <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
 <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
 <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NyBTYWx0ZWRfXwgxA5luzfAcJ
 AcZ9CK/tluylvKE9+NK79gpSDUVOlrs4qd9F37tiEblnJwLoeCunN/ZdwvurZRu/r3CADVPr6yO
 +PwmBN5lHgbChtRZiTmevC/vLJH3z0whmkothsOIC/rKURHIYxEfRwSnEOiQ0LsyiSoEQXJnRWX
 qSLzcywyOhoQPxW/MBQMfldW45ArArKl0eS4rKMV3DagnEHae440rwqvKhk7HG5VcnZMDXhPxlp
 oi6GaFOHbqLewuQFFuZQ+BAP3NeM4LZj6wd7Lz+d72USwjIciSJG2URt7/aSk4kAQ/dTFzkI69j
 cI9mMPHlJoCaIUH4R07AWElubr2dW6oiHn+GDw/z9SfjGCx5wtEHkAI4AAYo47Gj6Iqc8VxyWap
 vWnqGnMIQPGXW2A7PHajsI94QxtJQaFxcPE2GeFlk4ALfh7BDMSyFfY6qdJjsD/u9GgnCiyo
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839dfdf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=hMb-uB02kSkghMJ30ZAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: QHVGL1wJTMXgBbholcWqakaupoXUYg9b
X-Proofpoint-ORIG-GUID: QHVGL1wJTMXgBbholcWqakaupoXUYg9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300147

On Fri, May 30, 2025 at 07:36:05PM +0530, Jyothi Kumar Seerapu wrote:
> 
> 
> On 5/21/2025 6:15 PM, Dmitry Baryshkov wrote:
> > On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
> > > 
> > > 
> > > On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
> > > > On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
> > > > > Hi Dimitry, Thanks for providing the review comments.
> > > > > 
> > > > > On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wrote:
> > > > > > > The I2C driver gets an interrupt upon transfer completion.
> > > > > > > When handling multiple messages in a single transfer, this
> > > > > > > results in N interrupts for N messages, leading to significant
> > > > > > > software interrupt latency.
> > > > > > > 
> > > > > > > To mitigate this latency, utilize Block Event Interrupt (BEI)
> > > > > > > mechanism. Enabling BEI instructs the hardware to prevent interrupt
> > > > > > > generation and BEI is disabled when an interrupt is necessary.
> > > > > > > 
> > > > > > > Large I2C transfer can be divided into chunks of 8 messages internally.
> > > > > > > Interrupts are not expected for the first 7 message completions, only
> > > > > > > the last message triggers an interrupt, indicating the completion of
> > > > > > > 8 messages. This BEI mechanism enhances overall transfer efficiency.
> > > > > > 
> > > > > > Why do you need this complexity? Is it possible to set the
> > > > > > DMA_PREP_INTERRUPT flag on the last message in the transfer?
> > > > > 
> > > > > If i undertsand correctly, the suggestion is to get the single
> > > > > intetrrupt for last i2c message only.
> > > > > 
> > > > > But With this approach, we can't handle large number of i2c messages
> > > > > in the transfer.
> > > > > 
> > > > > In GPI driver, number of max TREs support is harcoded to 64 (#define
> > > > > CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE and
> > > > > DMA TREs. So, the avilable TREs are not sufficient to handle all the
> > > > > N messages.
> > > > 
> > > > It sounds like a DMA driver issue. In other words, the DMA driver can
> > > > know that it must issue an interrupt before exausting 64 TREs in order
> > > > to
> > > > 
> > > > > 
> > > > > Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
> > > > > or 'num' incase for less messsages), process and unmap/free upon the
> > > > > interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> > > > 
> > > > Why? This is some random value which has no connection with CHAN_TREs.
> > > > Also, what if one of the platforms get a 'liter' GPI which supports less
> > > > TREs in a single run? Or a super-premium platform which can use 256
> > > > TREs? Please don't workaround issues from one driver in another one.
> > > 
> > > We are trying to utilize the existing CHAN_TRES mentioned in the GPI driver.
> > > With the following approach, the GPI hardware can process N number of I2C
> > > messages, thereby improving throughput and transfer efficiency.
> > > 
> > > The main design consideration for using the block event interrupt is as
> > > follows:
> > > 
> > > Allow the hardware to process the TREs (I2C messages), while the software
> > > concurrently prepares the next set of TREs to be submitted to the hardware.
> > > Once the TREs are processed, they can be freed, enabling the software to
> > > queue new TREs. This approach enhances overall optimization.
> > > 
> > > Please let me know if you have any questions, concerns, or suggestions.
> > 
> > The question was why do you limit that to QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> > What is the reason for that limit, etc. If you think about it, The GENI
> > / I2C doesn't impose any limit on the number of messages processed in
> > one go (if I understand it correctly). Instead the limit comes from the
> > GPI DMA driver. As such, please don't add extra 'handling' to the I2C
> > driver. Make GPI DMA driver responsible for saying 'no more for now',
> > then I2C driver can setup add an interrupt flag and proceed with
> > submitting next messages, etc.
> > 
> 
> For I2C messages, we need to prepare TREs for Config, Go and DMAs. However,
> if a large number of I2C messages are submitted then may may run out of
> memory for serving the TREs. The GPI channel supports a maximum of 64 TREs,
> which is insufficient to serve 32 or even 16 I2C messages concurrently,
> given the multiple TREs required per message.
> 
> To address this limitation, a strategy has been implemented to manage how
> many messages can be queued and how memory is recycled. The constant
> QCOM_I2C_GPI_MAX_NUM_MSGS is set to 16, defining the upper limit of
> messages that can be queued at once. Additionally,
> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ is set to 8, meaning that
> half of the queued messages are expected to be freed or deallocated per
> interrupt.
> This approach ensures that the driver can efficiently manage TRE resources
> and continue queuing new I2C messages without exhausting memory.
> > I really don't see a reason for additional complicated handling in the
> > geni driver that you've implemented. Maybe I misunderstand something. In
> > such a case it usually means that you have to explain the design in the
> > commit message / in-code comments.
> > 
> 
> 
> The I2C Geni driver is designed to prepare and submit descriptors to the GPI
> driver one message at a time.
> As a result, the GPI driver does not have visibility into the current
> message index or the total number of I2C messages in a transfer. This lack
> of context makes it challenging to determine when to set the block event
> interrupt, which is typically used to signal the completion of a batch of
> messages.
> 
> So, the responsibility for deciding when to set the BEI should lie with the
> I2C driver.
> 
> If this approach is acceptable, I will proceed with updating the relevant
> details in the commit message.
> 
> Please let me know if you have any concerns or suggestions.

- Make gpi_prep_slave_sg() return NULL if flags don't have
  DMA_PREP_INTERRUPT flag and there are no 3 empty TREs for the
  interrupt-enabled transfer.

- If I2C driver gets NULL from dmaengine_prep_slave_single(), retry
  again, adding DMA_PREP_INTERRUPT. Make sure that the last one always
  gets DMA_PREP_INTERRUPT.

- In geni_i2c_gpi_xfer() split the loop to submit messages until you
  can, then call wait_for_completion_timeout() and then
  geni_i2c_gpi_unmap() for submitted messages, then continue with a new
  portion of messages.

-- 
With best wishes
Dmitry

