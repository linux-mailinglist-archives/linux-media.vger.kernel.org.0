Return-Path: <linux-media+bounces-969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7057F710C
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 11:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5D5E1F20F2C
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 10:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0872A19BD3;
	Fri, 24 Nov 2023 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H8SXOa1D"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D0910EB
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 02:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700820918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TTq8+kCBsRfezDZUZNy6OCUhutJdQNVSX6U8E7Z+Kf8=;
	b=H8SXOa1DZZrG4peNW1udGd6J1/1yVoM/VXhGpTWXfyW7P2P04cKxDwd3MlzjWLv37/IUNV
	cL9j95QSFw9iKLNFnBI4adDWjNslv16iMGojyg3MZn78msSLb2Jo36qosQst3NXG2XKIFU
	oO1ciD50bXExse8KAPfCUZ2MwsS34uE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-67mX9tN7Nyqjs77GtjcILg-1; Fri, 24 Nov 2023 05:15:16 -0500
X-MC-Unique: 67mX9tN7Nyqjs77GtjcILg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77d7bfcceaaso77994085a.0
        for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 02:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820916; x=1701425716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTq8+kCBsRfezDZUZNy6OCUhutJdQNVSX6U8E7Z+Kf8=;
        b=l2MYAwcoK8rOMBcQeOG9hUU+iitYUUnlMxAhenhEZXvohuszZ+udl9bttnE2BfoGCc
         0kGtGOw+KdXwl9hK2H6qV98ls4Og6ELUV1nZMI722yQ0JxX8yVUpC07/Vm3WKALK3Gw+
         SZMCTyCPcJjzCCRp6TsLuAjw2sHGpaZ0+a/sdR9eeMHKCe8DelmCEokXKeH0iI6FR5fZ
         P+/7dfdsaYdavdpXhhCoAFfPWk8NyyTu/qYW7RbTS2lb9Wekbc5L3YV59nuTy9aoLWgz
         huVXauNDCKWtsKit47TPJY0VVA3pswWJxbitbm7DETI7UVHma8bv7ZG61iWL2LzgEmXw
         Otpg==
X-Gm-Message-State: AOJu0YwSJlOc7K54x6azhRT4inUW+NP/ggDuFGhFUgPnRIjOxcmVkThq
	UE4FITRYZCrm7MUVRgnTirkJMbjfJKMqa6PxF9hakf7XZkLkGEwtSpNHPWFOy3yJeRFU4ALda3h
	lzgne2KZjKwi9up1evNSQmw==
X-Received: by 2002:a05:620a:294b:b0:774:d3f:c78c with SMTP id n11-20020a05620a294b00b007740d3fc78cmr2910546qkp.72.1700820916392;
        Fri, 24 Nov 2023 02:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3RJxpHx9XF5gTOs5+1q6RlhTFoQIQfE2hazERkN73qvfSSfainOz1S68urbbGGyVvjNRErA==
X-Received: by 2002:a05:620a:294b:b0:774:d3f:c78c with SMTP id n11-20020a05620a294b00b007740d3fc78cmr2910528qkp.72.1700820916165;
        Fri, 24 Nov 2023 02:15:16 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-24-178.cust.vodafonedsl.it. [2.34.24.178])
        by smtp.gmail.com with ESMTPSA id b20-20020a05620a0cd400b00774830b40d4sm1131051qkj.47.2023.11.24.02.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 02:15:15 -0800 (PST)
Message-ID: <9fb1cd9d-89cb-4f45-9d0c-9f0102e000e6@redhat.com>
Date: Fri, 24 Nov 2023 11:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/test: add a test suite for GEM objects backed by
 shmem
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20231123100147.212645-1-marpagan@redhat.com>
 <dkh6t5cya7tw4wz5aqrgvnqqnyzzgvbyvezxexy6pyspju5qbd@cdl4vvs7kvnt>
Content-Language: en-US
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <dkh6t5cya7tw4wz5aqrgvnqqnyzzgvbyvezxexy6pyspju5qbd@cdl4vvs7kvnt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2023-11-24 09:49, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Nov 23, 2023 at 11:01:46AM +0100, Marco Pagani wrote:
>> +static int drm_gem_shmem_test_init(struct kunit *test)
>> +{
>> +	struct device *dev;
>> +	struct fake_dev {
>> +		struct drm_device drm_dev;
>> +	} *fdev;
>> +
> 
> [...]
> 
>> +
>> +	/*
>> +	 * The DRM core will automatically initialize the GEM core and create
>> +	 * a DRM Memory Manager object which provides an address space pool
>> +	 * for GEM objects allocation.
>> +	 */
>> +	fdev = drm_kunit_helper_alloc_drm_device(test, dev, struct fake_dev,
>> +						 drm_dev, DRIVER_GEM);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);
> 
> Sorry I missed it earlier, but you don't need the intermediate structure
> if you use
> 
> struct drm_device *drm;
> 
> drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_GEM);
> KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
>

I prefer to use drm_kunit_helper_alloc_drm_device() with the intermediate
structure. It makes the code clearer, in my opinion. Initially, when
developing the suite, I was using __drm_kunit_helper_alloc_drm_device()
as most test suites do, but I feel the list of arguments including
"sizeof(*drm), 0," is less straightforward to understand.

Thanks,
Marco


