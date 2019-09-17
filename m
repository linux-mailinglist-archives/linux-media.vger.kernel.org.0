Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636CEB5731
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 22:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbfIQUwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 16:52:46 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:47039 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfIQUwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 16:52:44 -0400
Received: by mail-ot1-f67.google.com with SMTP id f21so1191911otl.13;
        Tue, 17 Sep 2019 13:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fMeEne97qv8JgyDBdhgCgz19g4bKacaJieBUVcMpack=;
        b=mlqpZK9xthaMKikW8riP5E+V89oPda99k4GJuxJSH/yjmdYzJiBP7UsX1e9YS9A5u0
         h5dwb+pCPNf0mC/pzvVb4pa4tOaA3rcdjcA3s0/6wrAsqiMbWHEinbibT322RDBCJrv1
         MOMwK/CuCgO+3e18sYI2G/59xO0H9mxuqfoC2N1OCXb273y+GVkidlTQRUH+I/F2aHzA
         bvnwC9B0NYa5hBvUBBHDIdSTXxKFc57K8NtH6vtqKCDBmZ4qW7ahUM+f8Eknfy4UM2Cp
         +2IIYJHjD5TBaEbFyPINuW4grvp2/om6CW1XLnGhRf6tykAxVflM7fdocGvqkpQDp+jW
         OBNw==
X-Gm-Message-State: APjAAAXW/1I4XRvA8e8qP78NXSTOZcFXnRJH+93oCNL6+Ig/hNoRJq22
        AALwApcwTZSwpPlghbcoGA==
X-Google-Smtp-Source: APXvYqzRKAYZIfGsZkV4fCugV4JzQs8fH0BJsUQ19vkI9qCJna0q4Qb3+RlGtktm94O7IeQFbkDXJg==
X-Received: by 2002:a05:6830:124f:: with SMTP id s15mr611563otp.95.1568753564008;
        Tue, 17 Sep 2019 13:52:44 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v132sm1162365oif.34.2019.09.17.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 13:52:43 -0700 (PDT)
Date:   Tue, 17 Sep 2019 15:52:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jan Kotas <jank@cadence.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, rafalc@cadence.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Update bindings for Cadence
 CSI2RX
Message-ID: <20190917205242.GA15921@bogus>
References: <20190905105601.27034-1-jank@cadence.com>
 <20190905105601.27034-2-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905105601.27034-2-jank@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 5 Sep 2019 11:55:59 +0100, Jan Kotas wrote:
> This patch adds a DT bindings documentation for
> Cadence CSI2RX v1.3 and v2.1 controllers.
> 
> Signed-off-by: Jan Kotas <jank@cadence.com>
> ---
>  Documentation/devicetree/bindings/media/cdns,csi2rx.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
