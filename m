Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB7BC9E44
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbfJCMUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:20:34 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35374 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCMUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:20:34 -0400
Received: by mail-ed1-f68.google.com with SMTP id v8so2281063eds.2;
        Thu, 03 Oct 2019 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VMN71rteRHeDLeFUmyCrt4iewlOqhW55q/Q1E8ZLlqo=;
        b=VnhzNJxYGqNYeExwF/BHd7Z6SMdftYmvL+5hDLELvXDXdaK+uhTGtjVfFR72XR8GLV
         lhiikc/CuyyWjd3titMS82mqFA1PPgyhH0UHzbuWV7HGR0NlDLFLgWeXpYR7GHNCWSsR
         Wsy5oSX/3z0MZBAN2/TdWnd6rnwwEOaFvesqpa/9kWbmbnoihwdtWzbQhHPRhV0uMxtD
         Z7Mv+UvuaocoVsRCixweKQCGe6eRiOlfbPAeyjhzXiK5chhDxIKESTCdeI1WaBeLclyp
         exF5hykucGi/zkinhoaNPE9ZnE7a2KJSidvftNAbx4nhJUlYb7Brc1lkq9Zo4WnzHhN3
         UJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VMN71rteRHeDLeFUmyCrt4iewlOqhW55q/Q1E8ZLlqo=;
        b=jRuPJ9bbhYJLEWK4wjz9p0XrRZMcGl3TQGElWgJDNhyl+6tOStPNAZs+YPEHwEO6pz
         s/t9toBgJ2eIzMvVOFLESZAqMeFKA7OOPfeSpOdPO/tJyzkslwYn/xl+/9xMl1HpaMW4
         z/d4WWB/Oo3ekM6nDngxneRKL5sKq0VV/1I/hpZOMCrEMAkINZyA1iU8nJuxVxqkfAX7
         3Gkaj6j8XhmLrcGAdZdy2jCQZdkPFqUuOayNKVxSZjuz8QiA0wTcgajrs4qXdHKbPAfL
         vfLN5/kG9yKWKOrDNVYVXO1QD1RF49sk0qf4AuqJaJ5lKUsoxzW65jYnDroHxbqpcp6G
         idCA==
X-Gm-Message-State: APjAAAUg13CYsMrIDUgA6YHU+GuVEcssVFXQ0GdwgVZEScq63/G8RT86
        mlSkmY1Bs9K4Fj+QDLNcxNTF84hUuyQ=
X-Google-Smtp-Source: APXvYqx01yQwECD9Bae9bZM2VyQVjTCu+aqosCV/g/OygzNEAhYEV7aZSizLcbEQWwYZdUozLtYuOw==
X-Received: by 2002:aa7:d48f:: with SMTP id b15mr9164825edr.159.1570105232491;
        Thu, 03 Oct 2019 05:20:32 -0700 (PDT)
Received: from Limone ([46.114.33.168])
        by smtp.gmail.com with ESMTPSA id p4sm439372edc.38.2019.10.03.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 05:20:31 -0700 (PDT)
Date:   Thu, 3 Oct 2019 14:20:27 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003122027.GA2674@Limone>
References: <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
 <20191002150650.GA4227@gofer.mess.org>
 <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
 <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
 <20191003081742.0933264b@coco.lan>
 <20191003120143.GA2995@Limone>
 <20191003091201.7e94c617@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003091201.7e94c617@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> well, you could try to increase the timeout - although 100 ms seems a lot
> of time to me.

I tried 5s, still no change.

Would it be possible to include my patch, possibly with a warning like
"bogus chip version, trying with no firmware"?

g

