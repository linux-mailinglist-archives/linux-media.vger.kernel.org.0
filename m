Return-Path: <linux-media+bounces-57439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CD1HZvGx2nRcAUAu9opvQ
	(envelope-from <linux-media+bounces-57439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 13:16:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9F34E600
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 13:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4ECDB3038F04
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55ED34C815;
	Sat, 28 Mar 2026 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKZ7UBcw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ku0Mj88/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE8819E819
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774700176; cv=none; b=IOgmtL+8V1oFkJgVsjD1d1J0jIOBXror0E1PYyZ/Rvn+bmdAz+99dnbiZ1HuVVQzZRIzHcKEZi+B2WsQPc8w9lpkX+M5pTOGPPM7jd1ZRYbisacc6V6AzZfixB27gtGdDJRfQl2YC1juD/Vt8aD1M5zioo9Z7DbZ3ZYYhd6HprQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774700176; c=relaxed/simple;
	bh=22p32sOyazxS9lN7zVwtAi1DvtcC+gS0iaNmXk27iXM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pRs8h+21vgnGR5ajpyeDAfpPGenjPs/Mn7mHOm3gbGJeRFNKMVzt5HOUdmLublGOCOdXHyyVBHr5NeyBSP81/z+lHRTY7h+EFv6/Oluf5ooxog9iqCSI6zf1FvQZpYIHDe4QrAFKpRPckvZUILx8qDPSPpzVtrWDYHLllwEXtos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKZ7UBcw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ku0Mj88/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S3je4k1291559
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 12:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GwHabpXdJFpVvhzsxsVxbsthvthkUhtnxF1TgaI0seM=; b=iKZ7UBcw71phtVoE
	IhhLz+XIH+VZs0N8hQ8z1low0FkpX0s3bZc3ksmSMiqd78V4vbbCT54iTXOgJjkU
	4mWcBH5Csi/ZyH1HL8lzCJ1n1miYZ5PgmmWaVevt2w8MkIb8ydg0gwo7yDGWxoLo
	4WhzEv3ngl8vIkinLY8fWGoVa9F6b32oYWA1nF7+3pAjxB64D7D8gb6aFeFxSsYj
	df6jlw5tnOVtXL+bhcDBSByDmdyiI5WadkzdkgKrrQU1bw/hpiT8PIqpSbUDzSrL
	5mzrB+GLxB4PgogyGxVqIMwiAtPmyJG+/7+ASHxFiwnfdXjtXKDcwTGZQenu+dSm
	CaieUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c78r62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 12:16:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094741c1c1so72970711cf.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 05:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774700173; x=1775304973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GwHabpXdJFpVvhzsxsVxbsthvthkUhtnxF1TgaI0seM=;
        b=Ku0Mj88/T2oD8zCmRjSXWMpKLMBqjdA2M3wqu3XDRo7yp/TGuTXoGqIHusAtSI6JM4
         uKdGcKSZyeEKuMvmFqG4qwnk9SFNaY+xjg00k3q8bGiCwOx65o6k3O1BNoJQ9vkkj+wi
         NDVeItTCogvUMnuoAvpymZovk2Xm4pVqFdjdaWOJ87vD9He17GHIHD/4sSnW930UznlR
         a70bPY3AJEUU+wmoax+GU0wR3EMhWPU18Q50CLgX/5Hdh72RaHBHONIXRNoKeH/bQb9p
         Oz0ilf+NEMjImBnmYKoSVW5XEmpJojlRUV5S4CDjleKA9NFZg+HpdA1Lj0NIKGT5AxaB
         CIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774700173; x=1775304973;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwHabpXdJFpVvhzsxsVxbsthvthkUhtnxF1TgaI0seM=;
        b=GCELX/7rGbsiX/5dfR7Hq8/VauFXhjZHX11y1FKg1+sp7iyGqnjpqBFs8uMb3kGoPf
         xfFZ7kJRLvXqzj5xw5cVNKfFJxxCOcGD4ip3US3P8GHvvpoDZf7hD7dQqQHtlD0ekZWo
         ni3YHKg4EOmtvUzIudzJC/et5yH2OzlFJF+aASOIM9tpIVCy6Ka5yF7nabXVEV3ENGGD
         CKxvpLSSjClpu4A6xb/ObXjoqg+A1SyxHQ/aWmqczoy5lJdOYihX2lUDSqPKEodJjby7
         MeRye1fgSWPVmMDbJCmtqPQTQ/EAc3VVny2lhX9pKyNXJ61dKhc5hP6SQmca4SFccv5W
         CWQw==
X-Forwarded-Encrypted: i=1; AJvYcCWVANHEwEfGTWq/5GxRSKTkWnTmGya2IuNIMKlhjcBj8kfcl4qB6nl2SKD8jWKWNeGPhK743kP9e7vQZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vNCOh8Yjw0Nn2rvi1pxH1NUy7aDbOL4zFrwLpl2tGpNJCuYI
	Me5yo3lR6S34zB5EC2uZzjJJyk3dB/+8c4cFuMHAv1NaiSVABhOKmAZt7TJhS/2MqBqV+B6JTBK
	D7P5NqZcRDnaPvwlhYB/Oa2GL6u22OTjZ8umQo7Tzphd7HwlmTJT5gIqWwGuIhvXWcA==
X-Gm-Gg: ATEYQzyE4wWO5CAuLvwkYBf18ADKAIQwH296vSnOLttYtxMXy5jyh+auMleAqwA1tl7
	UClZcN+JYBooa/UQXeC5MTV3R376gjTl5vil279Nm+psUyovKuQZuaj4t3UodIs0C578MJVUA4g
	W4qRLiRhI5FBXDxEPW1wBmEE7LU7aQetj4ZmbjnGLvfmENv6Ujs8SdYpOJ2qgJL2wq0nJzXuGlr
	qhJePAT/nnE+mkxmjzugk5qqK6naBe9vtrOUteLgMb396fuRI3eYRwZJiZ6eQM0sRYbxBiw4ZQj
	KhYZuwZM2YDM40rdtcMHtuxTWD6bEOoHTnQCPzCmraJkQzZMaqykLRzG9y5AVJOqWwTIQjt8au4
	m8dFy+lZqYPsuDczAJfQxEvzrCt893fIr5oqrzruSiGLcnXlShKrHx+SOJIw7WHg4gs8pFCRfpS
	9S4z3bwh36zjYnwnb0rj1fm8y8/alwaobcc2VRgPlQlrFVh4ZInhLrRqaIpOdyud5YxqaYcMH60
	rYkM4WwdUbRrQR6
X-Received: by 2002:a05:622a:393:b0:501:b1d8:637a with SMTP id d75a77b69052e-50ba39e3270mr84462561cf.61.1774700173271;
        Sat, 28 Mar 2026 05:16:13 -0700 (PDT)
X-Received: by 2002:a05:622a:393:b0:501:b1d8:637a with SMTP id d75a77b69052e-50ba39e3270mr84462131cf.61.1774700172851;
        Sat, 28 Mar 2026 05:16:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76081d09sm511580a12.26.2026.03.28.05.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 05:16:11 -0700 (PDT)
Message-ID: <4c1742d2-eb3a-4556-b2ab-0a375f70c6cb@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 13:16:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_1/1=5D_media=3A_dw9719=3A_Add_back_the_I?=
 =?UTF-8?Q?=C2=B2C_device_id_table?=
To: Michael Anthony <manthony.nw@outlook.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
References: <AMBP190MB2678CBCD19A1B6416481EBB7ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
 <20260326174909.2746696-1-sakari.ailus@linux.intel.com>
 <AMBP190MB2678B1B58D91EE699BC5D9DDED56A@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
Content-Language: en-US, nl
In-Reply-To: <AMBP190MB2678B1B58D91EE699BC5D9DDED56A@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69c7c68d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=vTr9H3xdAAAA:8 a=6ABPrATuAAAA:8 a=VwQbUJbxAAAA:8
 a=bVeDM_8WYctDTnI_AFAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=FCRCnXBEA80fiJtl_cq2:22
X-Proofpoint-GUID: o-k6Lcam2aV2hrtkzzKly31evNcyb0hL
X-Proofpoint-ORIG-GUID: o-k6Lcam2aV2hrtkzzKly31evNcyb0hL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA4OSBTYWx0ZWRfX4Gp8YsROUUZT
 JRDji8qwd71BikSajaNwV/CdnjhzUiKAI2u24n1bqH7rqjEcD48A4yPpBcPkJrqpXTohk/kiSE9
 bCcraqtV8aemDXN1VkzYa3A+wJyoJTlh77Jxr3iLXZ/9Ep50D402CcoNOTkTE91yapbylDcAzY2
 yn+1wUuMCJrwTJxHpg6jAgM/0FH80dzenagr5amyVP3ujZgNr34u9yCReVYbyhI0lT5EnDqWV6Q
 r5BYz1yQWvxlX2zAKdExR0H/hZKiQ9eIKVNKZ7Nu02x31oT0P1gaW5mQmKQevYJeEPQtrENYQ+p
 AEWL7Iks6oYhrLtL0YDFqBMWubx3LZjK74IIsCZ3V/x5Jrm/3Ym368lpRbUR0qRUDRqMcys2sZn
 ZwB0U2MekYfbAmLnVch7sRI9kjJUvo1715eauWvEXCqzw4/+hoLNk5FeKX4nD/eHAOwaXjtg/S/
 m6yci+X5wsAk6JPUwDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603280089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57439-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com,linux.intel.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,fedorapeople.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7D9F34E600
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

On 26-Mar-26 19:04, Michael Anthony wrote:
> Hi Sakari,
> 
> Thanks for replying to me.  I am new to linux and not sure how to test whether this fixes the issue.
> 
> My report was based on this being the only relevant change that I could identify between the working Fedora Kernel 6.18 series and the Fedore Kernel 6.19 series that stopped working by searching through the history on the kernel.org website.
> 
> I have reported the bug to Fedora as suggested .
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2447694
> 
> If I can provide any information from my current working or not-working kernels, please let me know.

As I also mentioned in a comment on that bugzilla:

Thank you for reporting this.

I've started a Fedora 6.19.10-200.bz2447694.fc43 test kernel
build with the dw9719 patch you got from Sakari applied to it:

https://koji.fedoraproject.org/koji/taskinfo?taskID=143771571

Note this is still building atm, it should be done in a couple
of hours.

See here for instructions to install a (test) kernel build directly
from koji (Fedora's buildsystem):

https://fedorapeople.org/~jwrdegoede/kernel-test-instructions.txt

Please give this kernel a test and let Sakari know if the suggested
fix works, then Sakari can take the fix upstream.

Regards,

Hans




