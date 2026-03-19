Return-Path: <linux-media+bounces-56342-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOg0Nr4LvGkArgIAu9opvQ
	(envelope-from <linux-media+bounces-56342-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:44:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C54E2CD16E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A316A31462F3
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B563D7D60;
	Thu, 19 Mar 2026 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYUGN5Ub"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DA53B19D9
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931388; cv=none; b=UXiysMZ2lZzfTX/ZUpWKkuxSs8rmjoAqYQg9VuKquFX+a0lImbHlNt3QrWqX07W45XBpV9RJwjprYDjjvVs10ynv9J+/yZkmQdE7RXKRVRD28H042F2hd/VUUGqCIu1d35ZLw5a8LfoqkkH3XGCKctNt+Q31COR9cLNXj77QbGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931388; c=relaxed/simple;
	bh=LqO95S2oX1JKV3VA16abIl+G54sj1NrGBzMiboxj1sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OlnNJtL8qIAw9eCqkW/Kq9UZsOLLuSd8ZY0mHNtGtUUkO2G1YIWb4XG0CyPLPZiJD4HP+6YvDc7IXgyXSUf6coG4bRw2reB5D4nzyEn+GH9p4k6nS/l+/QrDCfo0Pghne1c/NK5tDwIV3JDMs0rwbbVsbJAoDr1UeZBvmjPuNog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYUGN5Ub; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b0586d5bb8so5704165ad.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 07:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773931385; x=1774536185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CE8wXgkuBaP9Z+pEoEhpUGW+wfFybV/tf8cLOkrCEM=;
        b=TYUGN5UbaZFSs8MEvDpVk+9X8iA7LbCt375+PITcRNOYhBNVzMBiqqpJnJdiHRhxXV
         V76TgAz+rASV+ojU+McCrEJPoII3E/4qm9pKTVkD1u9k6sWNH4FgPaj21JrNipYe2Y7m
         qTbj75oXGzqg0i2lj1BOXQ9YZXQPVTLBR9nXx722UxOwUQObR2k/7jTnUo1RuMlLT1nV
         Kn8F5VREx01l7rvfZi1fn4yV6uNTvNLiqmG1tI/ktnwbogSVjiIlbs4NjBBYdcFpX2P4
         pA1uqNAQvS9SvnAir2Wcmf9ndqLTJ4r65llWGgKyIU9YBNieGreE2vrBwTo1c5aL+Gkn
         84Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773931385; x=1774536185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CE8wXgkuBaP9Z+pEoEhpUGW+wfFybV/tf8cLOkrCEM=;
        b=VtVnohjtjNnZmS+bFa0ous/AVlovfLtQWMEwV7IADhMJ7Xom8ltsfkeKfxC4a3XrF6
         OyNjv282Zir+8ElNS3oCjX7HHL6pOyNAmCAKrg0hIrge/g+4nlDSftdVyrLgLnP7ycva
         JRrximkJWlzAk80t68QAMG8EH/wBK5X2yupKaiZvKwbtYhYCl8u1YHjLSFa02ci+RkFY
         aZDS1mxuWpeZ1zqX4iy5TY5y7FZ6+m58m0QENlTAAucg7ZqUChSmnZsJsYycjBo8gcy2
         OVpLNz8e3JwMmRzbTcQ1i+UBS2hLP24PjEla0ne8g1Uf2gNOPpyf8Hohyrgl2Y7Xxz5w
         bJIQ==
X-Gm-Message-State: AOJu0YwhiKkRQTzRJCTj0/oB7rfiMKrnMVtyZKvezftkTmZbFe0BaQwj
	uI5X+i+4PRcSL1fWc8NvvgV8XC5hdUo/rlOBVX9SOADE7tZDOH5h+ivI
X-Gm-Gg: ATEYQzy1UTJg2XJx0QuZa+q63tzOrh2SYyiwXhrJXBrThKFwvWiTwLoX8q+Agq5w2ES
	9goJD4PJ9ri9fkKr91rigKNxOde6UJozUxdmasZ4V0JRbnYmDt0pzViIG2PAKo2mAxXYa6LJ1z5
	ZFjWSGby2nvNAbCofcgcOX2ll9/nKT8G1nj8ZhuV/moCXuGJfxvSmiwVo1jNSUALlj7xJjWTaQ6
	5m0LEpyz6w2EqjR7uGlvs63enCihH4Moci5Qw0h37Wj5yb+N8qvRwI1Z2L06NU1RErF2dRNvPc/
	NWcOqgZBeJqTOzJFZt83QSjgVwN8LDBinJwKm7pvfhrIY7m0xO2h8CzYAlmeH8zQWDu2uSvyDI7
	kTmzyMMl7NOx2J4HHxuKPhnHRX/rYM/2UFylG4H2YAl71mReIuzcH13CmK0YdQXDwmDQFII8wuC
	9hNzBB7UM1ML3C9ttYioAj4Waerz9jzuw=
X-Received: by 2002:a17:902:ecd0:b0:2ae:54b2:27c7 with SMTP id d9443c01a7336-2b06e418908mr77693525ad.39.1773931384943;
        Thu, 19 Mar 2026 07:43:04 -0700 (PDT)
Received: from [192.168.0.106] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f0f25sm60516775ad.42.2026.03.19.07.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:43:04 -0700 (PDT)
Message-ID: <44b1f4b2-69d8-423a-8ab2-8de7b2fa84ee@gmail.com>
Date: Thu, 19 Mar 2026 20:13:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: buslogic: replace strcpy() with strscpy()
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Khalid Aziz <khalid@gonehiking.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <20260314-strcpy-v1-1-0b38691fe11e@gmail.com>
Content-Language: en-US
From: Atharv Dubey <atharvd440@gmail.com>
In-Reply-To: <20260314-strcpy-v1-1-0b38691fe11e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-56342-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4C54E2CD16E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A Gentle Reminder for reviewing the patch.

Thanks,
Atharv

On 3/14/26 01:58, Atharv Dubey wrote:
> strcpy() is deprecated as it does not perform bounds checking[1].
> Using it can risk buffer overflows if the source string exceeds
> the destination.
>
> Replace occurrences of strcpy() with the safer strscpy() where
> the size of buffer is being checked.
>
> Compile tested.
>
> [1] Documentation/process/deprecated.rst
>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>   drivers/scsi/BusLogic.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
> index da6599ae3d0d..c070f3b8197e 100644
> --- a/drivers/scsi/BusLogic.c
> +++ b/drivers/scsi/BusLogic.c
> @@ -1262,7 +1262,7 @@ static bool __init blogic_rdconfig(struct blogic_adapter *adapter)
>   		for (i = 0; i < sizeof(fpinfo->model); i++)
>   			*tgt++ = fpinfo->model[i];
>   		*tgt++ = '\0';
> -		strcpy(adapter->fw_ver, FLASHPOINT_FW_VER);
> +		strscpy(adapter->fw_ver, FLASHPOINT_FW_VER);
>   		adapter->scsi_id = fpinfo->scsi_id;
>   		adapter->ext_trans_enable = fpinfo->ext_trans_enable;
>   		adapter->parity = fpinfo->parity;
> @@ -3451,12 +3451,12 @@ static void blogic_msg(enum blogic_msglevel msglevel, char *fmt,
>   	va_end(args);
>   	if (msglevel == BLOGIC_ANNOUNCE_LEVEL) {
>   		static int msglines = 0;
> -		strcpy(&adapter->msgbuf[adapter->msgbuflen], buf);
> +		strscpy(&adapter->msgbuf[adapter->msgbuflen], buf);
>   		adapter->msgbuflen += len;
>   		if (++msglines <= 2)
>   			printk("%sscsi: %s", blogic_msglevelmap[msglevel], buf);
>   	} else if (msglevel == BLOGIC_INFO_LEVEL) {
> -		strcpy(&adapter->msgbuf[adapter->msgbuflen], buf);
> +		strscpy(&adapter->msgbuf[adapter->msgbuflen], buf);
>   		adapter->msgbuflen += len;
>   		if (begin) {
>   			if (buf[0] != '\n' || len > 1)
>
> ---
> base-commit: 173b959a8bb814f55660f7c34ddedd4e75c203d2
> change-id: 20260314-strcpy-da7093836551
>
> Best regards,

