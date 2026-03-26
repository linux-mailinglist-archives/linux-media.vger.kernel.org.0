Return-Path: <linux-media+bounces-57152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIsPMDw/xWkU8wQAu9opvQ
	(envelope-from <linux-media+bounces-57152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 15:14:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A18336A30
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 15:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EFD8314DDAD
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8692F5498;
	Thu, 26 Mar 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSKxrEhw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1B62D780C
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533684; cv=none; b=ZyvIkSgIyyXSkRqsXUcaIrUHm2JWQ5kzxGbqwBRtud1nLuY5OTcKaFCdbY3ly1Sch/CqzStBrthg4Jj1hLCS+kTaYWAP7DDgAanLUezQNKjrVofpbQGqE6qHaEx4JFFi2mY5mZa/ZcsBbCOSjF7edyZmni/DnoS4o3D7QHVO/5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533684; c=relaxed/simple;
	bh=zV4BTAK25VN6mTe+kd7900YWMIJutukIQQdSIEYQDy4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ky/PIOrxcKn8jVm0W2c08frIUfUYDBVdNCXDtKI31dqIe0mQFTLIH6/4i/GeV7UzN2NxnSwHkXjMp71mzTm/WMHRVnexm4ikmdY2DEWBdSAqPxg0yiK0Flj2phNdh/O81RIHmrwiwG8/0Uaw8QWRnQ9tMSa5rk2imHaCK4zZmVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSKxrEhw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so504807b3a.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774533682; x=1775138482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ygd3w9l/HpfiWp0ONN6CYNRkzO9t4Tq7Hl8hMcjf9H0=;
        b=eSKxrEhwf1uSEuoz8YqEz2+5mR13TV1Fr/U1yhLi1zhmSfbXsmqqI28avX5+yhCAmJ
         jXpgdetEHMBQXYpGvdL75K12lvcnREauu7RLKHhsHh8fuXOSSRvba2w21i/hZWbhsLNN
         zV3S9V+UySQAV9wg/t4vouwkK+IXK9faEXK4r7wKh594TM6Z9/2LVn3zo8R7buRpviPZ
         YTRbbdJk4cJqIFwhChe9TKFzghHlIjKvX/UqJq0+0Ub45vptXxJ9mX/bOFg0Ifq/am77
         dPw/ZppqJdUM9dHfnahTXzIBD9vKhAQGmskL/CHmEv1aH4UJ8YiwUUI4zEa9aLbrgRwf
         Wpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533682; x=1775138482;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygd3w9l/HpfiWp0ONN6CYNRkzO9t4Tq7Hl8hMcjf9H0=;
        b=Xfn2atQ+1WZ2FCQc575e6AJjcbt3Gt3bNjO03ng2DXoNFruOlN6ZpHQ0k6slvueXSp
         ayEBiNefGm3vOizf+bIEr8gR/JP8YsnhO5422HA9G00ancN7rdQUdLgsAywiUvvIz0k5
         q6PRXFOLCjbDH2zuXtq8aLIp+j3rAHuPd0UmNzKQnqKQGlgs0qtHi8BPS8blR4QG3l4A
         uHiOC67jfXd5490V7pKiEHWynBY3ECx12r7Ey1sFBOLTj2uNlXpucV0UoV31DqpxKfPj
         NF1qISVIMhaks7El6rap4Ko8dZLgrRslhesACEQ5KrLPV3lJKjtIbyuc0RP+E54x7qoO
         go8Q==
X-Gm-Message-State: AOJu0Yyn+2AS3sOHXZuAPreMhtPZm8V1xLXkud4hMcQK0aSSuAM6RfkN
	PBkDBgYtHZgZjFBmlHkhKGjlKkhSRiuM0sxyNsaF9EMFxyud3qFwVqk8
X-Gm-Gg: ATEYQzwuBQb4HMcdflGin07HfT2hur+gdhibMvu8LchIGuvygKTVthxlR6W4L35DU5c
	jbab3yLEgYVunK+5AxVNhFv3HPDxOTRpN4DXJzResTKCinz8ibLYg9VvlnyzzWBE00ISvorlpOw
	FJPABXuyklrE1nBX6nIrKh7s2yn8Nycg6HpRxPGJhslwiO15iHzJd5Pyu1z664ofpj2hQJ0MWQq
	MP7tx+jd8rxKzrvBcrn/ENZdFlRU3K0A7UppEDcSgZYgt1nt/yWiKFb2YP/oFZlu9d4Ztb8PM3Y
	QnTz7r+ekJauCibOmhqeo5AJ4TCu9kmcxhmB5neXlGtYqThfGyCc9Pu52GS8zFF550KpIOG9h16
	ZnnFR86OSU2DiQQ1wHcXQtqcfpSvy3SJU+xtvkCQ35T4YGK+BQ4scA2QuS8AJbBYpdr4QRSnDKZ
	zeQac2Oxgt3JzFPpZqzgCqZsRuJVafPZuJhE/jzEhwSA==
X-Received: by 2002:a05:6a00:414e:b0:82c:693c:20d with SMTP id d2e1a72fcca58-82c6e1659admr7549573b3a.60.1774533681909;
        Thu, 26 Mar 2026 07:01:21 -0700 (PDT)
Received: from [192.168.0.106] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3bf324sm3551504b3a.40.2026.03.26.07.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:01:21 -0700 (PDT)
Message-ID: <721ccd4a-109e-4e80-9116-9d116536e9dd@gmail.com>
Date: Thu, 26 Mar 2026 19:31:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: buslogic: replace strcpy() with strscpy()
From: Atharv Dubey <atharvd440@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Khalid Aziz <khalid@gonehiking.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <20260314-strcpy-v1-1-0b38691fe11e@gmail.com>
 <44b1f4b2-69d8-423a-8ab2-8de7b2fa84ee@gmail.com>
Content-Language: en-US
In-Reply-To: <44b1f4b2-69d8-423a-8ab2-8de7b2fa84ee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-57152-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23A18336A30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A Gentle Reminder for Reviewing the patch

Regards,
Atharv

On 3/19/26 20:13, Atharv Dubey wrote:
> A Gentle Reminder for reviewing the patch.
>
> Thanks,
> Atharv
>
> On 3/14/26 01:58, Atharv Dubey wrote:
>> strcpy() is deprecated as it does not perform bounds checking[1].
>> Using it can risk buffer overflows if the source string exceeds
>> the destination.
>>
>> Replace occurrences of strcpy() with the safer strscpy() where
>> the size of buffer is being checked.
>>
>> Compile tested.
>>
>> [1] Documentation/process/deprecated.rst
>>
>> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
>> ---
>>   drivers/scsi/BusLogic.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
>> index da6599ae3d0d..c070f3b8197e 100644
>> --- a/drivers/scsi/BusLogic.c
>> +++ b/drivers/scsi/BusLogic.c
>> @@ -1262,7 +1262,7 @@ static bool __init blogic_rdconfig(struct 
>> blogic_adapter *adapter)
>>           for (i = 0; i < sizeof(fpinfo->model); i++)
>>               *tgt++ = fpinfo->model[i];
>>           *tgt++ = '\0';
>> -        strcpy(adapter->fw_ver, FLASHPOINT_FW_VER);
>> +        strscpy(adapter->fw_ver, FLASHPOINT_FW_VER);
>>           adapter->scsi_id = fpinfo->scsi_id;
>>           adapter->ext_trans_enable = fpinfo->ext_trans_enable;
>>           adapter->parity = fpinfo->parity;
>> @@ -3451,12 +3451,12 @@ static void blogic_msg(enum blogic_msglevel 
>> msglevel, char *fmt,
>>       va_end(args);
>>       if (msglevel == BLOGIC_ANNOUNCE_LEVEL) {
>>           static int msglines = 0;
>> -        strcpy(&adapter->msgbuf[adapter->msgbuflen], buf);
>> +        strscpy(&adapter->msgbuf[adapter->msgbuflen], buf);
>>           adapter->msgbuflen += len;
>>           if (++msglines <= 2)
>>               printk("%sscsi: %s", blogic_msglevelmap[msglevel], buf);
>>       } else if (msglevel == BLOGIC_INFO_LEVEL) {
>> -        strcpy(&adapter->msgbuf[adapter->msgbuflen], buf);
>> +        strscpy(&adapter->msgbuf[adapter->msgbuflen], buf);
>>           adapter->msgbuflen += len;
>>           if (begin) {
>>               if (buf[0] != '\n' || len > 1)
>>
>> ---
>> base-commit: 173b959a8bb814f55660f7c34ddedd4e75c203d2
>> change-id: 20260314-strcpy-da7093836551
>>
>> Best regards,

