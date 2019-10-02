Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62FB8C8AF7
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfJBOTe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:19:34 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42763 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbfJBOTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 10:19:32 -0400
Received: by mail-qt1-f193.google.com with SMTP id w14so26505315qto.9;
        Wed, 02 Oct 2019 07:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:mime-version:content-transfer-encoding:cc:cc:to;
        bh=6UEBDQmoOShiLbp87rLz2SJ6Y3CaDTIMMgDWI85bPzk=;
        b=IsQlzVEdNey5uoVICB/pbhLoY5dHOk876batqIn2HibtmtAcZpBmNzsIZ60BNPklpH
         ipV3tonZ6Umz+Qc5CAcldWHYGQ5gvutvz8toYbrvytkO4Gk1vzt+1hmmVZSZOXZn7ie3
         5WfbHFf6shPGYL7VAABzt+Y9RH2baBfMSi8k9U3V9/qEJyA2A/id2eGhTun91BpDvhqa
         ck6G91hbEu7bsuCr3e4FIWCCtCgkbdCnMcUVXdC1zlF0ATiCIgIhdWycetQifuLMTjNF
         2VO1R6QTcqPghXMGk7H2QIhaqulKCsNHxbGHwdYrULX351l+z7reNu1qyxR0cYpfUaW+
         55cA==
X-Gm-Message-State: APjAAAXuDx5fjMJ0ROZQ/0JxlnykXTQhTp7SbBQAE/spREalWIZc/dA2
        06WRjivrU5PSRa1hpvXSVA8RHa8qdQ==
X-Google-Smtp-Source: APXvYqwA8KujX0j44nYaY0ep5VHU/Kj3c/ezUJXSNyQWpKPEUcSGF1G+CnoKgFo2MHwEE9vdfXZKVQ==
X-Received: by 2002:ac8:4784:: with SMTP id k4mr4248127qtq.303.1570025970096;
        Wed, 02 Oct 2019 07:19:30 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id z200sm10073665qkb.5.2019.10.02.07.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:29 -0700 (PDT)
Message-ID: <5d94b1f1.1c69fb81.ab470.458b@mx.google.com>
Date:   Wed, 02 Oct 2019 09:19:26 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/7] dt-bindings: smia: Remove documentation of nokia,nvm-size
References: <20190924112338.27180-1-sakari.ailus@linux.intel.com> <20190924112338.27180-8-sakari.ailus@linux.intel.com>
In-Reply-To: <20190924112338.27180-8-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 24 Sep 2019 14:23:38 +0300, Sakari Ailus wrote:
> The nokia,nvm-size property was used to tell the size of the NVM memory
> accessible through the sensor's register interface. However, while the
> size isn't directly readable through the sensor's register interface, it
> can be detected reading the NVM memory until the selected page is no
> longer available.
> 
> Thus remove this property.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/nokia,smia.txt | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

