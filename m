Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369EF138C84
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 08:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbgAMHwR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 02:52:17 -0500
Received: from mail-ed1-f52.google.com ([209.85.208.52]:45633 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgAMHwR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 02:52:17 -0500
Received: by mail-ed1-f52.google.com with SMTP id v28so7591180edw.12;
        Sun, 12 Jan 2020 23:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=soxPPP1ZI0ONRGIE6bmBJhnEMY0uT/RfAdWeC6j5b0E=;
        b=Tgy0RsXLOyZDrlw6l4V568dDaz/KtijZVTJ+nAA4Kv4p3jyVC+micLNzr2spsrb67k
         wntjwDN22LvVBlLnqkpeykvJ1HO0Kydhu60JOuCGHvucTih8uiroN1dmn48K5XcqLuH2
         WDHuaUTg9lAg7/wo7sUH7gqtG6SlMehvQctTnPMePnhtHodqwOE0VqBGKISpcrncUWaK
         Dy/n18JqtjR5zr4uDsBftz7E71ISiRkosxMZ1AcxJtVv+kKizoKoenf4aJ4FYsIcRsC4
         AR5jq2/97l9r5y0YtqGUoZct3NyhKXf/GSd6cpccgCSPIE6R8wMJQwumgGT35UsFu75x
         Ll+w==
X-Gm-Message-State: APjAAAVOnOrUP76QtCmagtOS9s1+Ses1T4EDN6Lz9iOGm7WEGm8xVfaW
        5ZtBgibN0DRYcAIkdXYJOIPv8F1wvWA=
X-Google-Smtp-Source: APXvYqygRlTjwBeD/K++XU6RwcobqP3LASm8y+JWasFBexgo6vO46tqs9Hx9bUNGjyxeTXmev9FWyQ==
X-Received: by 2002:a17:906:2892:: with SMTP id o18mr15492554ejd.312.1578901935058;
        Sun, 12 Jan 2020 23:52:15 -0800 (PST)
Received: from pi3 ([194.230.155.229])
        by smtp.googlemail.com with ESMTPSA id qc1sm388327ejb.49.2020.01.12.23.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 23:52:14 -0800 (PST)
Date:   Mon, 13 Jan 2020 08:52:12 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Chuhong Yuan <hslester96@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RFT] media: exynos4-is: add missed
 clk_disable_unprepare in remove
Message-ID: <20200113075212.GA1218@pi3>
References: <20191219074824.15047-1-hslester96@gmail.com>
 <f253eb6e-5e21-fd9b-8c2f-371beea66afa@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f253eb6e-5e21-fd9b-8c2f-371beea66afa@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 10, 2020 at 02:40:21PM +0100, Hans Verkuil wrote:
> Anyone able/willing to test this patch?

I do not have the hardware with FIMC/camera so I cannot provide testing.
However it looks good, so I propose to just take it:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

