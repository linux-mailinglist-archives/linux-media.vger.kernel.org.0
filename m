Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FF642FC1F
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 21:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238365AbhJOTaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 15:30:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52850 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234132AbhJOTaT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 15:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634326092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DHgVsI500xUtFvvJhND0q9V1AUlhJG7wr9pcaJspSiE=;
        b=huHEqXediGnG9fYFAPjwMs+ib7hZTClXil/dTDQItu4wD5UpzeKXXAkCU/t8KsmHNLrvDx
        aFC+PKp/YY2Q57qUZJEJDAPzqx4rrWL8+cmEHn9OjlqZWSSeVR388sRXH1kM9sUzajKAOi
        O3wGxjyK706IdjXYEXVJRQnB+MXiPrw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-pXL8BZhbNf6EZzJTmu2pog-1; Fri, 15 Oct 2021 15:28:10 -0400
X-MC-Unique: pXL8BZhbNf6EZzJTmu2pog-1
Received: by mail-ed1-f72.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so9137695edy.14
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 12:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DHgVsI500xUtFvvJhND0q9V1AUlhJG7wr9pcaJspSiE=;
        b=VZIHEnL0iF0MqYhAgjPeYov0unLjl9lV1su5kp3S616CefkWp2wSB6E0zUaF7pvy77
         ng4Ue1SD7ZNKNe75vMSDnsok31fRfVi/tAdZxyfWrGZHWlHFnQKngRqt4WlvWhiTiQHj
         XY9abuAfagY0/HGlJ4Rs0sXCNENEis4jqD+2XwJ+0SwiHnvso6/w3L5XPSrYuxQ79dMO
         MtU2mneTQeNCdGdraa+IiZaMMuvp1OYX5CVNSy8u/gLlJd3ulNE9iQF5/+aKqm8uc4Zu
         OnKmiPErgW7J2iYRr5cQz4iVnPpVntyUBsJrZBlyocQJa3jiG9OQvucXBAnDQFI0XDlc
         SHxw==
X-Gm-Message-State: AOAM533nTZKdu0MeL1xRrSKE4bGcIdMJsEfQ4TAvYHUTW5YjXu1mGKjP
        Mh/npyNXpJRqQMBVJqjfp/65p6Pf2B3aW3Jl+TJC32VEGRbbh3wvya4LbGLMaSrTTeRr9lHX+Fw
        Fz255Gutn8WATbT2ZTj4I8EY=
X-Received: by 2002:a17:906:270e:: with SMTP id z14mr9053738ejc.414.1634326089360;
        Fri, 15 Oct 2021 12:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy99ctIGjGxXAO5TNTGMcJ4devw27O3hL7cIKeEZl4TN6Opbo3iCGN5jicyxAP/sXDRjcROAw==
X-Received: by 2002:a17:906:270e:: with SMTP id z14mr9053711ejc.414.1634326089206;
        Fri, 15 Oct 2021 12:28:09 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id x22sm5218355edv.14.2021.10.15.12.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 12:27:54 -0700 (PDT)
Subject: Re: [PATCH 05/12] regulator: Introduce tps68470-regulator driver
To:     Mark Brown <broonie@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211008162121.6628-1-hdegoede@redhat.com>
 <20211008162121.6628-6-hdegoede@redhat.com> <YWQU/SYTT5Vk24XH@sirena.org.uk>
 <f6f2d7e8-fdb8-ed64-0cdd-65aded9fc42c@redhat.com>
 <YWmwZJvDYjPWJdb4@sirena.org.uk>
 <d0d1dc05-4cc6-2f47-88a9-700cfc356d86@redhat.com>
 <YWnPaI/ZECdfYre9@sirena.org.uk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <843f939a-7e43-bc12-e9fc-582e01129b63@redhat.com>
Date:   Fri, 15 Oct 2021 21:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWnPaI/ZECdfYre9@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/15/21 8:58 PM, Mark Brown wrote:
> On Fri, Oct 15, 2021 at 08:50:13PM +0200, Hans de Goede wrote:
> 
>> Are you happy with the platform_data for this driver as defined in
>> patch 4/12 ? :
> 
> Some of the other review comments lead me to believe that you'd be
> sending out a new version at some point?

That is correct.

> 
>> https://lore.kernel.org/platform-driver-x86/20211008162121.6628-1-hdegoede@redhat.com/T/#m745cc1191f531a57ae7998f5c8817ba9a46f0fed
> 
> I am very confused about why it's in the driver without a DMI quirk
> and/or clear comments about why and saying that this is a terrible
> example to copy.

The DMI quirks live in the ACPI glue code under drivers/platform/x86,
that code instantiates the MFD cell and sets the platform-data
as part of the cell.

> I'd also expect to get compile test coverage for the driver.

Ack, Stephen made the same remark for the clk driver. I'll fix
this for the next version.

Regards,

Hans


