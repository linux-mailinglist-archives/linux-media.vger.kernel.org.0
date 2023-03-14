Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28E1D6B8EEC
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 10:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjCNJmq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Mar 2023 05:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjCNJmg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Mar 2023 05:42:36 -0400
X-Greylist: delayed 61021 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Mar 2023 02:42:33 PDT
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E6693E20
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 02:42:33 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzbhx1tyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4502:69d6::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4PbT8P2kghzyQx;
        Tue, 14 Mar 2023 11:42:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1678786949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iVv9Ua/F/3ZnapfadeACNCmM0UQUvk+uXIejzOkYZlQ=;
        b=aj0DmFoW41ngF7XB6vLtNnoLfywCI3nb9mbyM3b8rSFVaHStxLpF6Ie1OURVy2aIWvKnw/
        mYQEFQmk5ahXpeKdzgfHlUoFzoQ2WdEnpJqWnNW4ACBafJHWWZL+ZDJM2KnVFSoSyO22wF
        FI3O26FK0gD8HSArop7D6OoosjRVoL0=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1678786949; a=rsa-sha256; cv=none;
        b=k6SodyHFZKWBkAl1lCBb0TNW4Qc2QxBAcInVT3uiztyYq4gWmq+QjVAT91k3M/MTYw50x/
        T7wHsuHIlGOlX/T9wor2hm4EVzyoNtH/qnyMphNj27LTNUEhMpifP6dB4z3qN0jN2lX9xe
        ltdDNwp1t0maNs2b0bBMl/mn0zuwXmY=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1678786949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iVv9Ua/F/3ZnapfadeACNCmM0UQUvk+uXIejzOkYZlQ=;
        b=w8inptmZt70BeRvs8smN/SC5vqNxM8cuLhQ/qBYsRu6nQZHb14Mi57pVO96FVMBuWLoGcQ
        V9i9FjzAc3ZQMyUcT6RmEC+LP+3i5sNRkRZQgzpULHhPhi3FEEZ6efmIRVu2pZ8jxOpQx0
        vdyQePeEk8C9u9EQ8l8QdtUxw6FuN9s=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2D551634C91;
        Tue, 14 Mar 2023 11:41:28 +0200 (EET)
Date:   Tue, 14 Mar 2023 11:41:27 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, djrscally@gmail.com,
        bingbu.cao@linux.intel.com
Subject: Re: [PATCH v3] media: ipu3-cio2: support multiple sensors and VCMs
 with same HID
Message-ID: <ZBBBR89YnOv3vwcI@valkosipuli.retiisi.eu>
References: <20230310151910.1623899-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310151910.1623899-1-bingbu.cao@intel.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

On Fri, Mar 10, 2023 at 11:19:10PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> In current cio2-bridge, it is using the hid name to register software
> node and software node will create kobject and sysfs entry according to
> the node name, if there are multiple sensors and VCMs which are sharing
> same HID name, it will cause the software nodes registration failure:
> 
> sysfs: cannot create duplicate filename '/kernel/software_nodes/dw9714'

Any comments on this? Seems fine to me. I'd pick it today / tomorrow if
people are fine with it.

-- 
Sakari Ailus
