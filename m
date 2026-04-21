Return-Path: <linux-media+bounces-59204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGizHY9I52kh6QEAu9opvQ
	(envelope-from <linux-media+bounces-59204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:51:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 763D74391F6
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DC2A3016B32
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 09:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81B221CC5C;
	Tue, 21 Apr 2026 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouesvUmV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djaXiOFr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD073AA1A7
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764838; cv=none; b=lZkA2sKE74dlYaJlbwpAfSWltxh+Xv5xvQB4Wh2icVDxk+Hv3OHiAuUCD++IF/+8Q8pyVb5HS+nrGmqZGPUhrofT31TSgBMp0AnEXPVq8y1EZrduA8Ej/lZB/gtYL6BttVllix5cN9cOYhsVaddJDjEqGg1gsWz/VyS/yxquSpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764838; c=relaxed/simple;
	bh=p/1n76QtndyA7N+mwa516LE4DjU1ZfZ8rucKJsWG1fI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lLjRQSEo20lvYbF5zLE8LOigmNddgeJ5FGba/T2sPisZCvpq6nq173c60SjTmxNvnxhSKLZpH5gusuUBETzFUx5ZQ4O3jz0XEnWe7Fi83e19mMVNOWPXq/tK8IazbhdvHuBhFKIB+lHQFyOHoZqj2qYnDMhQI+IzDlKl/jINKfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouesvUmV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djaXiOFr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L4XdkJ1510935
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 09:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rp6J7WgbrTFFo6tyAT+oL8v/X32Mr9UrX24jWpi2/iM=; b=ouesvUmVSh0q9boc
	vlbHLzY53BRcZflR4dJoOQ+R+RCa+NglfPCmGcM1/ooopXwaXyN4DdVJslHCBN2o
	hr0uQxltss2vj6qfJfmpsHCv1WoHDe2yG2MUhnG5TixnLleCwNK6ga7jXPqg9UPi
	zTsyDTZbHS1qmgoxmNRpGT3/ObeG4qsKKJP/N/IplsDKsYq49K73fXvlMayBGBoP
	4cBiFPWyoqpvruoj6VSd4vME6zRHtYSVr0rkBtGKi7SsRwpjlBCxo1HoL2csNNoW
	jErYfeVogMtWVZ3VmQU0WJSVtn2tnOmgi+B8eoNEyWwrWbp3+qpmAnuTLQDtulVB
	IXsRsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak160k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 09:47:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e5a336b44so2683311cf.0
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776764835; x=1777369635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rp6J7WgbrTFFo6tyAT+oL8v/X32Mr9UrX24jWpi2/iM=;
        b=djaXiOFrgZ/8EgJlccvJOpPVv30amK3f6ygWLqeXv1a6QAayBJvm/gJUQQsQEyw6z/
         Ilhi/WIZCkNfiU8kLKxd1jfqrEdJSEPHBzm75WcWYUm950nZvVcZZVd/QtgAeDV+yMOe
         V5I7sLLyc/VOU/KAPOm4bxWw1ch/NcyU9zqabTUafZoVXvIfNaz/AvCu/a60ne5Sv71m
         whd2dohBcfafjc2Js3gxX0O4cysE5kNVVH+Q3Up6r6fgZAPFBPmpaTrlDTGFL9VzKdWq
         A/7jbgcHLmMY8CS+vwwYYrlGM/Wh7jUnj9Hdvhy4J/rpWvNX6Bw9VcsaB6aC8wM1iHw/
         da7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764835; x=1777369635;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rp6J7WgbrTFFo6tyAT+oL8v/X32Mr9UrX24jWpi2/iM=;
        b=SImObEqEDfJf/HrYgj2pRWOUG3EKCnO+8jDuvTQXB7CNGp667NSo7f6pXrlryolP3d
         RwjrcttAcDwDcH8YSHP1pkOSr9YL9fu73XaFIedYBxB8AUvXL0b+KCfUxxP9jCuQMnBg
         5WgBPmURREh+Q7+2Ysr8UmrpD/i5ksqnbSfMrQtMeW7by93jywonTsVvxJ9hTf3O8+eu
         dDNZlGVy1pEO6h+FxROeDa+uPQT5utyoCXqoM/P64bagpBO8GJgsfSB0OJqE003h6bZ6
         mdMvV4/WRboupV+dguqlKwswFysekFMXfbH32grbXtL63Kb1FNR5CGJ1Ft4cflZdpw1l
         qRWw==
X-Forwarded-Encrypted: i=1; AFNElJ/rGLXnRx9mi5T0KbToFDKAvxqSCJmp7t0k/cT75+zy8XWAfdGHev/cmTcqZz/kfJP4PuO2ujII9jFuNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVdPUX5CJqnJd4DPGd4pK0Iv3PF7rnogtIE1WpOMOKsTcnh6ik
	8jm1onUaomVT4sskjYU4JzOJXRmvqB23fmxuxsAZpHpWlT1c/f0mtPwbBmPmUgmle4l7UN2ho8x
	SHN+xVQF6Fes9/xwK9mZmHzdBcTuZQRlMqKYMxPtVrbj7KEYtuhI0noJEgA3LFRzX4Q==
X-Gm-Gg: AeBDietS6KKLrYvo7wMo7UfeqHwwr9YQr+mN4FslvFuvOxk9XE/GTyX8eN4nqFQ97he
	r7b282wrNOkq9wl2Q4Kb18Y2XqE64Xqgr9R/HXuZGXRe8+/oFGThV6reXDpXkVUX2eW/9Z7pXRF
	LjVYQAjvjJgY9tnhjpFwo5JCaD3Nb/5qLkfHJRJZ/sROhgPKSlbeYAPoF/Yky8AJkT9Tkn8Amy9
	jc01Yq0U8e8b+uDLkxddHii7J3hBN4LUCs+6tMfWWjBbKMPQk0jy6zUvoekK8objQ0Gyz38xyvI
	dQ32UT2ApXSLZDQwskwPjCCT7lCPJK1Mn/eI8St5fOUhEFws9i1D1YZvGfdHyT9GTvSTxQSwdLz
	FVtlUuGcKKfFZuU/qeCeaWOcP5V8rjX5Vygz+a2j5/eof55mjfkShfEM00I8dkj4y0Mylk9vao2
	9bMsrOo+AhPR65nlMmbarDRD9Mx53Zma3qMTbj8OWcgjiNg5EnaR1dW3Ttb5EbGBncG/uMK4P8/
	Er2hthjAN3lvcnd7goQEEpxu8U=
X-Received: by 2002:a05:622a:1902:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50e367b90a2mr225159791cf.39.1776764835261;
        Tue, 21 Apr 2026 02:47:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1902:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50e367b90a2mr225159561cf.39.1776764834818;
        Tue, 21 Apr 2026 02:47:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451211091sm452427066b.5.2026.04.21.02.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:47:13 -0700 (PDT)
Message-ID: <07115433-dcfb-40a9-952a-5f841ee93947@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 11:47:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260417083214.222189-1-hpa@redhat.com>
 <20260417083214.222189-3-hpa@redhat.com>
 <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
 <aec9Pzr_ZUD0zBcK@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aec9Pzr_ZUD0zBcK@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e747a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=GbLmp5vPsrZZhUY_XBEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UMEgKFPNKbmx8t2U1Fc5kjjj85aVH9t3
X-Proofpoint-ORIG-GUID: UMEgKFPNKbmx8t2U1Fc5kjjj85aVH9t3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NSBTYWx0ZWRfXzsHttnxahAc2
 1mU9IYR3oXrz8s68Sceuj3arJUX7QSdT9L/RL8PCVkkRdGqhNnnaTJLNM2yYJDzQNdnm0MoyCPC
 uuhZfMnetMXc0t7TWUMbB5j0nndqOdbl2cv53pjH6mUiiR+uIRLkAfpHAcwHCexHZ9c9S4uWD/4
 m/lVm+oGu58u9AQKykvBUwEK0YjK7QTTt6xZY7tpp6WIMEdn08SwBWq5+5JSf5V06XpipwMAsxU
 8G9drikoqfD34uJqzgqB1ap5njuH0PGKA0Daa5qZg0sX5CVgGeg4oNUPIzmI2cAETRGctF9revs
 T3yiBdN3SYJGjyMO7ykR/ORAvpkmhEjTbZhetg4vkNlzSQmoh+ukzYmcKdFCV2iqqjMbWKD9UJD
 mX07I2KAjnM+Vl5kNqyCcCwyb8I9GU7UuzCaNENrdWcMSi6K3V0H5XB/uTzVSjnQWyuTPOr+nWv
 HOrsBRnQbnpNLTVOGYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59204-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 763D74391F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari, Kate,

On 21-Apr-26 11:02, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Apr 17, 2026 at 12:16:11PM +0200, Hans de Goede wrote:

...

>>> +
>>> +		cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
>>> +				flip_bit, val, &ret);
>>> +
>>> +		return ret;
>>> +	}
>>> +
>>> +	/* vflip */
>>> +	cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
>>> +			flip_bit, val, &ret);
>>> +	if (ret)
>>> +		return ret;
>>
>> Hmm, I wonder if the problem here is you doing 2 subsequent
>> cci_update_bits(). If the flip control registered is double-buffered
>> and the new value is latched as the actual value on the start
>> of the next frame; and this is combined with reading back
>> reading the active value, not the last written value then
>> the first time you do this the setting of the hflip bit will
>> be overwritten by the second cci_update_bits.
>>
>> I think it would be better to do something similar to what
>> imx219.c and replace these 2 cci_update_bits() calls with:
>>
>>         cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
>>                   imx471->hflip->val | imx471->vflip->val << 1, &ret);
>>
>> I believe this should work here too.
>>
>>
>>> +
>>> +	cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
>>> +		  value ? 0xe0 : 0xeb, &ret);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	cci_update_bits(sensor->regmap, IMX471_REG_H_WIN_OFFSET, 1,
>>> +			value ? 0x01 : 0x00, &ret);
>>
>> No need for cci_update_bits() here, the register is always
>> initialized to 0xc8 so this can just use hardcoded values
>> like the V_WIN_OFFSET path:
>>
>> 	cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
>> 		  value ? 0xc9 : 0xc8, &ret);
>>
>>> +	return ret;
>>
>> Updating both offsets here is wrong when hflip != vflip, you
>> should only update V_WIN_OFFSET when changing vflip and
>> H_WIN_OFFSET when changing hflip.
> 
> The cropping configuration should reflect the values on the sensor's pixel
> array and should not be affected by flipping. At least the crop window
> needs to be adjusted accordingly by the driver. Is there a need to change
> flipping while streaming?

Ah, that is a very valid question, no I don't think we do need to
set them while streaming.

Kate if you cannot get the start_x / start_y coordinate changes
when changing flipping to work to get a stable bayer output
pattern, then another way to fix this is to only allow changing
the flip controls while not streaming and return -EBUSY otherwise.

This can then be combined with reporting a flip-ctrl dependend
bayer-order so that userspace sees the right bayer-order after
flipping is applied as long as userspace reads the subdev format
after setting the controls (which libcamera does I believe).

For an example of an imx driver which reports a different
bayer order depending in flipping see: imx214.c and
the imx214_get_format_code() helper, a call to which should
be used to replace any hardcoded mbus-formats in the driver.

Regards,

Hans






