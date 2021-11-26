Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57DC445EC21
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 12:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbhKZLHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 06:07:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49852 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232665AbhKZLFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 06:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637924521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ERB2bt5FXrh0RIixB5MoY6SiAewQSpLXEYWyp2TpEqQ=;
        b=AJblL2VBoUIlso61tUYw+kE3teBq5BbhNw1+Q5gkvqRDA7nQR66HzKHdL+itUrHqAzzuQO
        kJATZJjbquPa0LKsvtWDRt74OU69xO3P2XmaXQ3OQog/Yek6UYOEoIsAg8EXoTDnYRadCi
        1wvJtc1CPv5ab15IVLJO7/LNItEM8+s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-514-RGR1AYciODChjjEmAQe56Q-1; Fri, 26 Nov 2021 06:01:59 -0500
X-MC-Unique: RGR1AYciODChjjEmAQe56Q-1
Received: by mail-ed1-f70.google.com with SMTP id w18-20020a056402071200b003e61cbafdb4so7742757edx.4
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 03:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ERB2bt5FXrh0RIixB5MoY6SiAewQSpLXEYWyp2TpEqQ=;
        b=ocm5oNwJ2Ji0e5ULQP3Y8JY5fGYjy5D3hQqcwzyQoCsqUrVDYKgDmyhYmHRUww+MtC
         CIAn4vF1HHQwSNojB4g147KH1p+T6FlDQWZYQ7S1Ec7mi7pawMoklyRlBiztUcRkkrH0
         I6U98H5Nsza9SAipHPvuSz+44GZ5YLtEWHCd7Ow3CGjoqVgZka3kv+OW/7LDjpLi3Gwq
         HecWIv4OfWgFj3CH44ZYG0nseqTE+onk0vyJx206uTsLgmgu0QJPp4t/BSew7sYlX15z
         3W7B4dcqZeyD9lpMo5XGMVqfsCzSHxRanaRqQmt8j+YnT0sLaIYLzxn7aFv0PyzG5S1W
         GmbQ==
X-Gm-Message-State: AOAM5313hSfnusVzN8XVL93OIQfShmynA9W4DSo60Z9R17KbU25NfH6i
        iUfVYsYUgBapb+scq8zK5oQqCJH7489R2KqD3nlisNmZgaw3AcQ3h3Dh2xPHsjXbJ2u3hMg1tsd
        SZuU6EVSCda0pfNySw2MxwIQ=
X-Received: by 2002:a05:6402:2552:: with SMTP id l18mr46607715edb.368.1637924518682;
        Fri, 26 Nov 2021 03:01:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSTeHJ+GGwtPrO5YGHvYkQmUjZzwtrQZaH9CnU/Bo2P+4aV/xidHXL93o/yLuuRd/5Idskvw==
X-Received: by 2002:a05:6402:2552:: with SMTP id l18mr46607672edb.368.1637924518428;
        Fri, 26 Nov 2021 03:01:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k21sm3480447edo.87.2021.11.26.03.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 03:01:58 -0800 (PST)
Message-ID: <64d0633d-dd53-1902-4f21-18146e16ad70@redhat.com>
Date:   Fri, 26 Nov 2021 12:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 13/15] media: ipu3-cio2: Defer probing until the PMIC
 is fully setup
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
References: <20211125165412.535063-14-hdegoede@redhat.com>
 <202111260530.KpKC5Rrw-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202111260530.KpKC5Rrw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/25/21 22:31, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on media-tree/master]
> [also build test WARNING on wsa/i2c/for-next broonie-regulator/for-next linus/master v5.16-rc2 next-20211125]
> [cannot apply to clk/clk-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/Add-support-for-X86-ACPI-camera-sensor-PMIC-setup-with-clk-and-regulator-platform-data/20211126-005917
> base:   git://linuxtv.org/media_tree.git master
> config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20211126/202111260530.KpKC5Rrw-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/e5cd2c79411cf24a2cabc5c7d2a222c1a3557460
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Hans-de-Goede/Add-support-for-X86-ACPI-camera-sensor-PMIC-setup-with-clk-and-regulator-platform-data/20211126-005917
>         git checkout e5cd2c79411cf24a2cabc5c7d2a222c1a3557460
>         # save the config file to linux build tree
>         make W=1 ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/media/pci/intel/ipu3/cio2-bridge.c:321:5: warning: no previous prototype for 'cio2_bridge_sensors_are_ready' [-Wmissing-prototypes]
>      321 | int cio2_bridge_sensors_are_ready(void)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Right this needs to be static I will fix this for v7 of the series.

Regards,

Hans


> 
> 
> vim +/cio2_bridge_sensors_are_ready +321 drivers/media/pci/intel/ipu3/cio2-bridge.c
> 
>    308	
>    309	/*
>    310	 * The VCM cannot be probed until the PMIC is completely setup. We cannot rely
>    311	 * on -EPROBE_DEFER for this, since the consumer<->supplier relations between
>    312	 * the VCM and regulators/clks are not described in ACPI, instead they are
>    313	 * passed as board-data to the PMIC drivers. Since -PROBE_DEFER does not work
>    314	 * for the clks/regulators the VCM i2c-clients must not be instantiated until
>    315	 * the PMIC is fully setup.
>    316	 *
>    317	 * The sensor/VCM ACPI device has an ACPI _DEP on the PMIC, check this using the
>    318	 * acpi_dev_ready_for_enumeration() helper, like the i2c-core-acpi code does
>    319	 * for the sensors.
>    320	 */
>  > 321	int cio2_bridge_sensors_are_ready(void)
>    322	{
>    323		struct acpi_device *adev;
>    324		bool ready = true;
>    325		unsigned int i;
>    326	
>    327		for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
>    328			const struct cio2_sensor_config *cfg =
>    329				&cio2_supported_sensors[i];
>    330	
>    331			for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
>    332				if (!adev->status.enabled)
>    333					continue;
>    334	
>    335				if (!acpi_dev_ready_for_enumeration(adev))
>    336					ready = false;
>    337			}
>    338		}
>    339	
>    340		return ready;
>    341	}
>    342	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

