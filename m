Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F580474D5E
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 22:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbhLNVww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 16:52:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbhLNVww (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 16:52:52 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F842C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:52:51 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id j9so2654146wrc.0
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=g1/eUs76GkqKL8wzidjwYfKZiH07OOFNZ+6VwJ/g578=;
        b=Y7xy/zQe39notcQ6SHoZftuCK0HeYFKNGJR8HLGktYgBYQoe+IHy8Wo2hinlFZ/7c5
         zte//JWQuB2ar5SZae3twt9DjzyXRx6uDKsxBVHVeIt+1oUsS8ufWxHyIYaZdHSNAmxp
         qyCcvjW3Ikzi6Av0kkzKBaSI19BZ5koLr0JbNf6pUKueSYwcN/g0Hdq9/p4gyWXpUUGv
         lbS9UDui3rxt6ubs9D09NGBhaJPxSYC6jgjw3avZSEe3KF47vIMmcq/sITbkHnb/NXLe
         XsCj1JfCejwaGPoOiI7nwTufSzHu+lYKd+oUpfr2yqo/zOz0Xyr7qtz3msLqZXuxyjmM
         GkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=g1/eUs76GkqKL8wzidjwYfKZiH07OOFNZ+6VwJ/g578=;
        b=GVA9V6MEYpiGh1hLjKkWFtA5BOvmTgrB6G0J7DLB3VDvizunLazoNEgwywDNK8vYg4
         Y/ZcZzS4pPzaIX2r/PNu3ksXZz4RHP67y3C2dTIRJHt44ONiYyFI9LDo++6dOdYVpMJN
         TuvClj8yaBUkFO2jzwp93H5Inq52f0bqybNV+0JqWTj8VP2IGYMujcDO5ZWtrcm7Zy8C
         5taHoeqIPmsXIsTRbcB0iLyjFaABbCTrREVNTgV6oJaYeyJv8OAJR3wQRhp6pPAb48cJ
         bhTM+1XHWpSIzws9wHdkJ14F6bzuoVlCEvUOfCEUoKNpJ+SwVHxVhihwn8fe7VHzsf7P
         w37g==
X-Gm-Message-State: AOAM530rU8h3VK4R73w2CvNdx1jMgd+nDUikd0lQF2UaCTVm/qpeHxxp
        BVvue5ArfmbiWiGay8IF3ws=
X-Google-Smtp-Source: ABdhPJwv0Yr7VA5Zfi3/Y+CZ7YPetFqoxAon1DTje7RFjOaWRyitDts/n+IkuBvCKLTL6elMqUlHQQ==
X-Received: by 2002:a5d:648d:: with SMTP id o13mr1691884wri.636.1639518770258;
        Tue, 14 Dec 2021 13:52:50 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s8sm128314wra.9.2021.12.14.13.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 13:52:49 -0800 (PST)
Subject: Re: [PATCH 1/5] media: media.h: Add new media link type
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-2-djrscally@gmail.com>
 <YbkRmyQp4SfWLeY1@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <c6fd2bd6-13a7-0993-d9fd-e9e40fb8a5e5@gmail.com>
Date:   Tue, 14 Dec 2021 21:52:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbkRmyQp4SfWLeY1@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 14/12/2021 21:50, Laurent Pinchart wrote:
> Hi Daniel,
>
> Thank you for the patch.
>
> On Mon, Dec 13, 2021 at 11:28:45PM +0000, Daniel Scally wrote:
>> To describe in the kernel the connection between devices and their
>> supporting peripherals (for example, a camera sensor and the vcm
>> driving the focusing lens for it), add a new type of media link
>> to introduce the concept of these ancillary links.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> changes since the rfc:
>>
>> 	- Split out into its own patch (mostly so it can be followed by patch
>> 	#3, which corrects some media-core code that is otherwise broken by the
>> 	new links)
>>
>>  include/uapi/linux/media.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
>> index 200fa8462b90..afbae7213d35 100644
>> --- a/include/uapi/linux/media.h
>> +++ b/include/uapi/linux/media.h
>> @@ -226,6 +226,7 @@ struct media_pad_desc {
>>  #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
>>  #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
>>  #  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
>> +#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
> This needs documentation in
> Documentation/userspace-api/media/mediactl/media-types.rst and in
> media-controller-model.rst. The latter should probably be a bit more
> detailed to explain the use cases with at least one example.


Agreed - I'll add some for the v2

>
>>  
>>  struct media_link_desc {
>>  	struct media_pad_desc source;
