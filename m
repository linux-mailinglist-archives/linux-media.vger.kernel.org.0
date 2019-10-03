Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6B4ECAE34
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 20:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732327AbfJCScG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 14:32:06 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:40443 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731346AbfJCScF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 14:32:05 -0400
Received: by mail-ed1-f43.google.com with SMTP id v38so3488046edm.7;
        Thu, 03 Oct 2019 11:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KVk+NgObHvER0ricJHyUaK0DR9coH5Fy1XkrdPyPrJQ=;
        b=RJn+7s2tyWg39/r+EUZIHaK4DLrw/b0u5i7JmeXPCJZv2872ppQBOlHTiO8yGwjYRq
         wuB3GIyzSETZl9iWr0t5pf3LYj5ZnqMyvxgNVU/ZH2ouHyVS39QoQvJFJTIp/0GXa6xr
         4+6/lnovAkqvqPlObrn+Sv1qodBa/shepvuwkcYAYLxlGbwMrDn3LyaoAgi+No0+Anst
         tbi35+63jZc1DXs9OCZL9ifumNQzmFmTKkpd1UMR+QFQrBuKJ6JpDwfkAUeVk3GN/jAz
         +dgWcEwSoKwkh3xizljkIuQVqhjvSOAim0Mar7zzJuLM8KMlTKy6vLgPfZ7lH3QlYcit
         FyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KVk+NgObHvER0ricJHyUaK0DR9coH5Fy1XkrdPyPrJQ=;
        b=H7QHVMu25T7KFBku5WzRp0rkknr2MAzrLZIIyKamSvjgILKNLh/Kn5TU0/l1G7JryI
         dYl9Jak6FqmfFBXVoc0uKUNbgbsp3EiloQmxFv3vIWyugfUPsi+r9aImTA7PqUd12ax5
         Y00ewHthxe88zsPTEHBWio/qJ91ZjmopNy0aRwFZgl/pZjH6col8Tl2llQ7QDxw+pPGl
         yfxHmVLZgPKEPmhGOnUKoMSChu71eL+HMFoLMBr0fkBDjsM9/FPo/BGj9eGsolJMFH8Y
         oyfPXTj8QNmNBADDx+fh7PTChp1GoDUMnnJczCDo/67GKHYu2jNil2Ox+EVgFdMHGR/K
         Hlbw==
X-Gm-Message-State: APjAAAUaHiso/wrpmBU1EF6O8pF7gBweAdbPyRmvtikpmJs5RugZtDXr
        1yq2Uw/ohZyb8rX1m6Sfd2E=
X-Google-Smtp-Source: APXvYqzmKfOPlC6fywkYltewlVofcB4Gso3c5eOSEjI2+RxSEPm8LpLQtm6+nF7zcium317dhh0ClQ==
X-Received: by 2002:a50:91d0:: with SMTP id h16mr11387179eda.152.1570127523794;
        Thu, 03 Oct 2019 11:32:03 -0700 (PDT)
Received: from Limone ([46.114.33.103])
        by smtp.gmail.com with ESMTPSA id w16sm620084edd.93.2019.10.03.11.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 11:32:02 -0700 (PDT)
Date:   Thu, 3 Oct 2019 20:32:00 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003183200.GA2631@Limone>
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
 <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan>
 <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan>
 <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan>
 <20191003162326.GA2727@Limone>
 <20191003144225.0137bf6c@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003144225.0137bf6c@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> You could also try to disable the firmware upload at si2168 and see
> if the si2157 reads will succeed.

I disabled the upload and while vlc wasn't working anymore I got the
following messages:

[  168.196656] si2157 2-0063: found a 'Silicon Labs Si2147-A30'
[  168.223009] si2157 2-0063: firmware version: 3.0.5


It really seems that the firmware upload is the culprit.

g

