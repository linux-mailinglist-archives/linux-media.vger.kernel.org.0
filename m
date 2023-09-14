Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F5779FC46
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 08:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235498AbjINGpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 02:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbjINGpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 02:45:18 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393AD9E
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 23:45:14 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso545870f8f.3
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694673912; x=1695278712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qciRX+mxJBBHRMzVMlIssNJGjXlizxRyZBvLkx7U7fE=;
        b=JTaK5E5WeLjqYX1C5+GzqvJpnjEYFUttbFL+31zYY0aRSBxiAeMQfVga0MvQbuLdEr
         x0ISGAfZDchzTvsweTTRhaaMZd7nS2ysJvhv9Bh+Nz3DqD3OudKv6+gwer7riis5Ouk9
         GDbvRVmP32SOkPZ6S1iPVn0Zce26hmwZzGy90drPGW/jEyAQxI+IMd2uPXNm5P3/06im
         uVPPynKW4DFszRbROQU015MuYKPhT5mAcOLaBfRgi2jWcn2g5inM7AUN31bK+QC7TY0z
         lHO4DfFXHAGh/x2d25cI6PL9VHfQkGf2L1OHn0ESlvRXxisZle4vKQSaPC3Bcf9ISgQ6
         mWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694673912; x=1695278712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qciRX+mxJBBHRMzVMlIssNJGjXlizxRyZBvLkx7U7fE=;
        b=jksoFxfw5hSfKty+UCd99lmLCUFLzsmShsrtS2xh8V679lP8KbpYqXoHYDqvCMw3Yh
         NeKlTjZ3vtqeCjSo5SM7RKVgUSaEI9aCCVJuzxLnkuPF7uoIGJg60EvuwlvIpaodi7OW
         izaJ7JvH3vIUgRxc06dkqAek5p4YNxoFLfe0Yi6OJBrPeaZciySDH+ss/B3Vvnuk0S7d
         LK0nWbcxPKuwVI7uMgfoolS9PIG0oT70J1Cm5v4+Yifuf6jeWIdPo+CQEAprkqZNxFac
         stNxURQmQhlYp1dq5Ane69kWG2bfK2Id41t8vevmkaktnc6JXpjb/Jji1cfba0TrK8mq
         UZZg==
X-Gm-Message-State: AOJu0YwuD1H7gSmRWqzX71852ET/OV9OmEpWwg2Q2aJmk9avX0UsJvHk
        tkQHCBjNccK4g+JfSDUwhnSrJQ==
X-Google-Smtp-Source: AGHT+IHe7UCEpR+G+JyVeTmGXSRIMzrAAHrOS6yN9jozComNQvSSilZ54N6s5sU/SwELgdKIAspvGg==
X-Received: by 2002:a5d:458b:0:b0:318:7d5:67bf with SMTP id p11-20020a5d458b000000b0031807d567bfmr3770811wrq.49.1694673912687;
        Wed, 13 Sep 2023 23:45:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y12-20020adfee0c000000b0031aca6cc69csm861825wrn.2.2023.09.13.23.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 23:45:12 -0700 (PDT)
Date:   Thu, 14 Sep 2023 09:45:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Adrien Thierry <athierry@redhat.com>,
        Dan Carpenter <error27@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 5/5] staging: vc04_services: vchiq_arm: Remove
 vchiq_register_child()
Message-ID: <44275d78-7318-4a28-b048-01b60f90d2fc@kadam.mountain>
References: <20230913195354.835884-1-umang.jain@ideasonboard.com>
 <20230913195354.835884-6-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913195354.835884-6-umang.jain@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 14, 2023 at 01:23:54AM +0530, Umang Jain wrote:
> vchiq_register_child() is used to registered child devices as platform
> devices. Now that the child devices are migrated to use the
> vchiq_bus_type instead, they will be registered to that. Hence, drop
> vchiq_register_child() as it is no more required.

This needs to be folded together with patch 4.  Otherwise it introduces
a compile warning which breaks git bisect.  (I haven't tested this so
I'm going to be so embarrassed if I'm wrong).

regards,
dan carpenter

