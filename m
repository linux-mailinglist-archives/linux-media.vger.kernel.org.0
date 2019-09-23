Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9ABBBE97
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 00:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503477AbfIWWpj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 18:45:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34901 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392282AbfIWWpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 18:45:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so10124895pfw.2
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 15:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dD9byLk1Tx9Plup+AvdF7bH1lsfwrv+hU6TjIHJ7AiM=;
        b=SQc545BqocTTaFcprLPMeYKs+DwL+h5wFYyUGD7hkbhugHlAlchPy+ZX2YczzUFeqb
         5CHXZxMteiGd5s9v/KLdzmHPPn/M44AyNpl9J2jxD/aJraq6skMQyGTjS9XvUIcOWU9E
         wYc9FZbbFurWaixF9kTE8Ejzzcma+2oJjJFao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dD9byLk1Tx9Plup+AvdF7bH1lsfwrv+hU6TjIHJ7AiM=;
        b=NHF5THChKZ1aBiGqRXZhBLJwLdry8w7GuZgqTwtcBVtld6EZVT2NPvmsCsrC0qbU7C
         uVlbHAgjEj4LsvExcIae4amQjrxJPODNwoPjhttaYosajdLvU1TFZKsrzvKobq2KuiD0
         Hg7aCWM/4Fu1q8n67TLhi5SYd8YkUxrvc+RUBXi5bx8dO9qzkAmAa6VW82hmuHqxqNaw
         rWEpe10CYQTiEj6V0kyR3rIqH0GTiugcJ5DzesuF7uDLOUdt3Wfo7tkACzIW+/JPQiBD
         xMfYcgE5iwHP34dlqK5Ib1RQmPp+6w4fA7HUso2SrY8zH5fuYWNN2vGAUjT3+HmdRlRL
         Vopw==
X-Gm-Message-State: APjAAAV4rjGPMraK5bVvoI48oz1eziInRX+PPMdwxxhf9T7G911Mk5oW
        BIeAjmzIALivaLb8a4MqKtvnTQ==
X-Google-Smtp-Source: APXvYqwi9Em13OLwso62pTOFMS3xLV7frTZ4jn4ACdyWpI9Z1AHz7htTIXaZ1mjKZWkmfq15rkw8zA==
X-Received: by 2002:a17:90a:c244:: with SMTP id d4mr1949950pjx.129.1569278737040;
        Mon, 23 Sep 2019 15:45:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 16sm12875244pfi.55.2019.09.23.15.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 15:45:36 -0700 (PDT)
Date:   Mon, 23 Sep 2019 15:45:35 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] single maintainer profile directory (was Re:
 [PATCH] media: add a subsystem profile documentation)
Message-ID: <201909231544.9A0328AE8C@keescook>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <201909162032.F4462D3@keescook>
 <20190917102817.263517b5@coco.lan>
 <201909170930.B8AD840@keescook>
 <20190918082326.49a19a24@coco.lan>
 <20190921131307.77d01ebb@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190921131307.77d01ebb@lwn.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 21, 2019 at 01:13:07PM -0600, Jonathan Corbet wrote:
> Also, that file is nearly 18K lines long.  If some unsuspecting person
> generates a PDF and prints it, they're going to get something along the
> lines of 300 pages of MAINTAINERS, which may not quite be what they had
> in mind.  It costs (almost) nothing to put that into HTML output, but
> other formats could be painful.

Is this something that can be specifically excluded from the non-HTML
outputs? (Or rather, specifically included in only the HTML output?) I
don't see a way to do that exactly... maybe in my RFC only the html
target would get the "real" file?

-- 
Kees Cook
