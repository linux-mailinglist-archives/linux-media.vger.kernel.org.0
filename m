Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AB62440EE
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 23:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgHMVyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 17:54:53 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:43368 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgHMVyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 17:54:53 -0400
Received: by mail-il1-f194.google.com with SMTP id y18so6809449ilp.10
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 14:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yu76w298hJlQsx20+kMlg4hu12yfVGJ9ZvxCU3fguN8=;
        b=fY5t2M2Oc4LBEaP0B5UuXhn2wfhWVbzu412olrsuJ5TZSC4BC9mUEY+7g50j5DyPtq
         9fh3FcV8ZLS0D3nu6GZOiPaQRb2lpzXGpo6lopTkCx21VnBI7xbuHBvGw6CnapzpJRYR
         4scPT/+yYBE/V/YFdbvGXglvl5HfV4EuPg6VBRHs0XMnDAT5N9jvvnLCg4hTXPWhhlLd
         t4cLL5woFcMNpnQwsxvAGOnBZRF5WgiG487Vh0SQKTWPEjCOb7zdMIKfrrTcrD5aGCqg
         MpdFwJt7JwShxZNV8rV4x92Hr6C/b8HYVxnDTdPNSAzBmuoolnGoU7nFAdSx1xgs1LH6
         Z2YQ==
X-Gm-Message-State: AOAM532S6hjvvR2Lg1Z787i/X2L9Tnj+Xigc3Z3PCPVTbrZFgh+BSYUn
        N+RT8B2MIq0hguWfHhPHdUM=
X-Google-Smtp-Source: ABdhPJwcSfwgz6w605XSjivuvNUcezPJ3CxXAT3Tik6bGVRiumgERnCIFXareMYSxNrYdtF06E8GnQ==
X-Received: by 2002:a92:9fdb:: with SMTP id z88mr3080386ilk.57.1597355692761;
        Thu, 13 Aug 2020 14:54:52 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id 17sm3419135ilg.16.2020.08.13.14.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 14:54:51 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id B0FCC403DC; Thu, 13 Aug 2020 21:54:50 +0000 (UTC)
Date:   Thu, 13 Aug 2020 21:54:50 +0000
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Lukas Middendorf <kernel@tuxforce.de>
Cc:     linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/2] media: si2168: request caching of firmware to make
 it available on resume
Message-ID: <20200813215450.GZ4332@42.do-not-panic.com>
References: <20200813214538.8474-1-kernel@tuxforce.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813214538.8474-1-kernel@tuxforce.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 13, 2020 at 11:45:37PM +0200, Lukas Middendorf wrote:
> even though request_firmware() is supposed to be safe to call during
> resume, it might fail (or even hang the system) when the firmware
> has not been loaded previously. Use firmware_request_cache() to
> have it cached so it is available reliably on resume.
> 
> Signed-off-by: Lukas Middendorf <kernel@tuxforce.de>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
