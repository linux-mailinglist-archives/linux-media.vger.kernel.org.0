Return-Path: <linux-media+bounces-23195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7D9ECE06
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 15:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48A3316AC82
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 14:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82B2236914;
	Wed, 11 Dec 2024 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KfDsI2IG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF65233690
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926044; cv=none; b=rOVU++p9sj3UKO08gnwjrBTBomKYCvETTBZeUdKAu6HHkJdRUXElGGghFzYgSkoNZhVtgx2OWE2/Y5h1aUqY1NhL/58eUY0q+1h/F2Ia5WF+Kzcty6EvJEmhtUtDenu1m0qboVlgQtSnWgh1V/qYQYx/LSOCHMQKmRp5O89YbYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926044; c=relaxed/simple;
	bh=wQqjAKJQCXhldrFf6U3MKPIRSDIWGrTnr+t7qtM2Qow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0UZdjQPi0VUozK5cuhXW8GXQfZtVbrqdoDfE7Vg4C+LVgGqGVE93Q1G80OIpiSfSrY2/u9uevV/dLlU2nVoklsD0RZBkwgP+vbM5evAXbdQs/AUDB2ADNKzqKYdp4xcI+tkh4QK/7cFxKdODOgLmTEezJqV1ZRoc9eKVjdPrSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KfDsI2IG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733926040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiYzs1QZGdkxtOEkNa+BNj3RT9r9zcCl2iJzZ/KVCQ4=;
	b=KfDsI2IGiDuIQd/NPdgXQz6JBFOlCLqanXfmNJgkf/oKgDvKbGst+SDy5cTwlwwLEYK3wP
	LwCdMd0I4H6qmHyOncrROxy+/RM72v/gmzRCWLG8k3ZgxH8ro9JjWPoqMNNQDYRb/xiGyE
	O5ec8HEad39jI3YFwYcCdjS5Gcr7iCg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-8BtPeRqJNHG_GD15PeyxDQ-1; Wed, 11 Dec 2024 09:07:19 -0500
X-MC-Unique: 8BtPeRqJNHG_GD15PeyxDQ-1
X-Mimecast-MFC-AGG-ID: 8BtPeRqJNHG_GD15PeyxDQ
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa6b69163caso48498266b.0
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 06:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733926033; x=1734530833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiYzs1QZGdkxtOEkNa+BNj3RT9r9zcCl2iJzZ/KVCQ4=;
        b=qEzXvuLj2ET0Xm9j03uhMHXMatC9lGoRcEyTb400q5ou/PPEzJ4A5luGvR4Q1KvqA0
         1BExcV1Z58cOzDnJAyUSgEC1tqFhK9Tws68Fnj+ytI5cvz+jMumWN045IwYHSuwMYkYE
         li3qVapH/ccQ8VUrj0CSoQVYjkmBa+fQ1aBvSg+aTiSzM3GoNTB2/UGV/GCot3ABXC4/
         OK5m05syoDc7/TFRLxsVOp2AVQobkxI0R32y43S1upnqztyM7sS+1ZLZDwmBuBx12hsp
         y4jCXrnPZPOuyTQtZ1BEFwAV1hrouoEDrEq+I7UStrrfIN2U3cepx9rNlFx79pIDdroD
         iDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0cxAitbGqjef7lPwTbWPhPNEKR0wazoVI/SvcNIuJ/7DNFI37CsJGRM06shDi/f6ejMjNH6qEmyhw5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYl//Kg1fbO8Zk2f1qyI/2V6k4DRv8rYvRaSDs/6uia/s7ROeY
	6dfPfrFFzgxYOSEEzP/c+5gFPbNek3kDpr7Txwskgaw1QBgxz/HEK5wlukXyByIaV7SyudYR44s
	lMkErUmeQb4If9WwPKFkm2UsPRI3mZleJ6BRvKl7SHf0qvKC8Clrc/k34EajR8P+mfSUw
X-Gm-Gg: ASbGnctPfT14u7yp/EB041QJbRH1F7t53egW4Byr4RniNEQm3pnSExVYGrszzkZ0AUX
	b4nn7vtMZptuOysKZEM+TxEN4kWk7XoFIjOKdeHKye2EhN29/lFPEGIhY2xjND6khDmTpBOUhDU
	hTV5Uw4b20uBfyFi+ZonIzK9YH2zytassuzG6MdRouATqt2hE0iShlkmfpupHgWtj65P/qJhmiP
	jLZHBsIh89WGo/HtiTsZ6aoQdXjUQwMWrC6jURXH171zJGU6TK0isIGkA5XyIsV6jjLsfEqVARP
	QCEszLZ5s1QR61gYzXsA22ItV8+k+QQvgYpPPCncs1fmbJoNModL7TXgme819oBP5DcwFUjyKtS
	+Gn17p2aZ3KzPB7ImkO9S8T0JbUNK
X-Received: by 2002:a17:906:292a:b0:aa6:a33c:70be with SMTP id a640c23a62f3a-aa6b114a41cmr277137866b.1.1733926033542;
        Wed, 11 Dec 2024 06:07:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUhpbEiZIf+tWyA8UKcxIFY0EEVk7rz0GPtF+H5dEeiDFrYV788K9sljz7QOr+krvaoG7wRg==
X-Received: by 2002:a17:906:292a:b0:aa6:a33c:70be with SMTP id a640c23a62f3a-aa6b114a41cmr277132966b.1.1733926033100;
        Wed, 11 Dec 2024 06:07:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68e9f52b1sm425906966b.82.2024.12.11.06.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 06:07:12 -0800 (PST)
Message-ID: <127a2275-6245-499a-8f84-353db8833989@redhat.com>
Date: Wed, 11 Dec 2024 15:07:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: intel/ipu6: remove cpu latency qos request on
 error
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Genes Lists <lists@sapience.com>
References: <20241211114905.368044-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241211114905.368044-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Dec-24 12:49 PM, Stanislaw Gruszka wrote:
> Fix cpu latency qos list corruption like below. It happens when
> we do not remove cpu latency request on error path and free
> corresponding memory.
> 
> [   30.634378] l7 kernel: list_add corruption. prev->next should be next (ffffffff9645e960), but was 0000000100100001. (prev=ffff8e9e877e20a8).
> [   30.634388] l7 kernel: WARNING: CPU: 2 PID: 2008 at lib/list_debug.c:32 __list_add_valid_or_report+0x83/0xa0
> <snip>
> [   30.634640] l7 kernel: Call Trace:
> [   30.634650] l7 kernel:  <TASK>
> [   30.634659] l7 kernel:  ? __list_add_valid_or_report+0x83/0xa0
> [   30.634669] l7 kernel:  ? __warn.cold+0x93/0xf6
> [   30.634678] l7 kernel:  ? __list_add_valid_or_report+0x83/0xa0
> [   30.634690] l7 kernel:  ? report_bug+0xff/0x140
> [   30.634702] l7 kernel:  ? handle_bug+0x58/0x90
> [   30.634712] l7 kernel:  ? exc_invalid_op+0x17/0x70
> [   30.634723] l7 kernel:  ? asm_exc_invalid_op+0x1a/0x20
> [   30.634733] l7 kernel:  ? __list_add_valid_or_report+0x83/0xa0
> [   30.634742] l7 kernel:  plist_add+0xdd/0x140
> [   30.634754] l7 kernel:  pm_qos_update_target+0xa0/0x1f0
> [   30.634764] l7 kernel:  cpu_latency_qos_update_request+0x61/0xc0
> [   30.634773] l7 kernel:  intel_dp_aux_xfer+0x4c7/0x6e0 [i915 1f824655ed04687c2b0d23dbce759fa785f6d033]
> 
> Reported-by: Genes Lists <lists@sapience.com>
> Closes: https://lore.kernel.org/linux-media/c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com/
> Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
> v2: add Closes tag

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> 
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index 77f9c7319868..8df1d83a74b5 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> @@ -1133,6 +1133,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  free_fw_msg_bufs:
>  	free_fw_msg_bufs(isys);
>  out_remove_pkg_dir_shared_buffer:
> +	cpu_latency_qos_remove_request(&isys->pm_qos);
>  	if (!isp->secure_mode)
>  		ipu6_cpd_free_pkg_dir(adev);
>  remove_shared_buffer:


