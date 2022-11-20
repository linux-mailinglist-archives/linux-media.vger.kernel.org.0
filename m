Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7356316C2
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiKTWMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiKTWMk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:12:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2335224F0B
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668982299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rw5YLmBV3zvgBgPqfqVMCiPaHG3CK9Os8KGj2+0wVYA=;
        b=CfaBtRU7ii8/1GjEqCWRf8TLC2AkwXb9ENmrNKuuOryZLnqij1m7tGJ3hc9gK72dN4/3Ab
        priSETk0XByxZMFGuyZJynbr4UoPTEc0sX8Rpb/yWr6bDHTbB/RZdxNcNFaHZ0MKnCTvdM
        Eo81rzC05Eda6IPzUFk11Yt9vmooU/Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-223-EVzjLt3oO_uLwAcSAKfsZA-1; Sun, 20 Nov 2022 17:11:38 -0500
X-MC-Unique: EVzjLt3oO_uLwAcSAKfsZA-1
Received: by mail-ej1-f69.google.com with SMTP id hr21-20020a1709073f9500b007b29ccd1228so5712258ejc.16
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw5YLmBV3zvgBgPqfqVMCiPaHG3CK9Os8KGj2+0wVYA=;
        b=BsQ7dz/gNlBIloxQ/QPz4TMKwnGzgbsEehGhACQ15SNVB18EPNBm1mb1Sq5osiobNP
         1gF8wvtKfx/IZ3FWq2y5XMnps20zNwaye7ve3ljQP2QJ+o63QfrxblNczuXGhA+pbKLS
         Yt6JWHsMKPEwJoZmiddAglgaCl4gcZT2Z+z6RNOy8OWvXAjvbWzo4FM6NOiHFfCVeB/E
         joLQgSX9iRJq0XIdedlkdvfHJRDt4od5YxOngID8oktP9b5Cq03duQEy5RJxWHifnRxu
         V4fit2v634G+Kg4Z4F01qG+cB9mKyy9b38OU6jMXy8FoxN/b8+OLt2xNWrolMPSsnl4J
         ndgA==
X-Gm-Message-State: ANoB5pnUxUvffXvHZ7HpU6c8ARJYuf4gk8DK+R7VyV6lw/OLTrjKLjtT
        Q6mYnzRk+/D/0zl8ZWCwVueWgL8lql7IOpdKwzde8oMW1GioUmS4cEMGl6GTQf8wdfSkQPpWSwD
        DkM2h5T+HjnwAXe37DXJTe68=
X-Received: by 2002:a17:906:b794:b0:7ae:6450:c620 with SMTP id dt20-20020a170906b79400b007ae6450c620mr13285793ejb.270.1668982297116;
        Sun, 20 Nov 2022 14:11:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5u5KSYHqmEK/ViaF1gT/5mAcAehoWkQ3IknmGdtE0s6DtgplFle6AyfvYaiGmWlVe3OuXK/A==
X-Received: by 2002:a17:906:b794:b0:7ae:6450:c620 with SMTP id dt20-20020a170906b79400b007ae6450c620mr13285784ejb.270.1668982296939;
        Sun, 20 Nov 2022 14:11:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kw10-20020a170907770a00b0078d4ee47c82sm4316439ejc.129.2022.11.20.14.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 14:11:36 -0800 (PST)
Message-ID: <22f1d502-4d0f-e7b3-b14d-3a99d1584912@redhat.com>
Date:   Sun, 20 Nov 2022 23:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 10/17] media: atomisp: Convert to videobuf2
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-11-hdegoede@redhat.com>
 <Y3IxGxZuJEO+yfcp@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3IxGxZuJEO+yfcp@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/14/22 13:14, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:26PM +0200, Hans de Goede wrote:
>> Convert atomisp to use videobuf2.
>>
>> This fixes mmap not working and in general moving over to
>> the more modern videobuf2 is a good plan.
> 
> ...
> 
>> -				/* The is the end, stop further loop */
>> +			if (list_entry_is_head(param, &pipe->per_frame_params, list)) {
>> +				/* The is the end, stop outer loop */
>>  				break;
>>  			}
> 
> You can drop {} by writing this as
> 
> 			/* If this is the end, stop further loop */
> 			if (list_entry_is_head(param, &pipe->per_frame_params, list))
> 				break;
> 

Fixed in my media-atomisp branch.

> ...
> 
>> +		if (!list_empty(&pipe->buffers_waiting_for_param))
> 
> Why not positive conditional?

This is existing code which is moved around, I prefer to keep this
the same to make it clear when looking at the entire diff that
this is just moved around and not changed.

> 
>> +			atomisp_handle_parameter_and_buffer(pipe);
>> +		else
>> +			atomisp_qbuffers_to_css(asd);
> 
> ...
> 
>> +	/*
>> +	 * Workaround: Due to the design of HALv3,
>> +	 * sometimes in ZSL or SDV mode HAL needs to
>> +	 * capture multiple images within one streaming cycle.
>> +	 * But the capture number cannot be determined by HAL.
>> +	 * So HAL only sets the capture number to be 1 and queue multiple
>> +	 * buffers. Atomisp driver needs to check this case and re-trigger
>> +	 * CSS to do capture when new buffer is queued.
> 
> Indentation of the above seems arbitrary.

Yeah it is, again this is existing code (existing comment) which
is just moved around.

> 
>> +	 */
> 
> ...
> 
>> +	/*
>> +	 * FIXME This if is copied from _vb2_fop_release, this cannot use that
> 
>  _vb2_fop_release() ?
> 
>> +	 * because that calls v4l2_fh_release() earlier then this function.
>> +	 * Maybe we can release the fh earlier though, it does not look like
>> +	 * anything needs it after this.
>> +	 */
> 
> ...
> 
>> +out:
> 
> In some cases you use 'unlock' in some 'out' for the same, I would suggest to
> unify as
> 
> out_unlock:
> 
> in all affected locations.

Fixed in my media-atomisp branch.

Regards,

Hans




> 
>> +	mutex_unlock(&isp->mutex);
>> +	return ret;
> 

