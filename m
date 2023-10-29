Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA467DACE8
	for <lists+linux-media@lfdr.de>; Sun, 29 Oct 2023 16:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjJ2PDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Oct 2023 11:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjJ2PDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Oct 2023 11:03:49 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A937BC
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 08:03:46 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6bd32d1a040so3652890b3a.3
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 08:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698591826; x=1699196626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H6ir4IyNIpgPfeg5PpaJZ9z59cp7XPXbuJPLYNgpBPo=;
        b=hf9QZRi9QLyNdJyghteYD6mBpLOEabguazWCYT65xoTC8ufNx5Ds7O254aIINzWDNj
         MS1UIT2VzvUbF/hNg5owdmah50v9/6Elm9oOZk4kp0kegxaEMAxmZZ0O20/1bArmJVip
         8tS8zbyfz61KsyfBTFU2mDo9PwfVeuBpBA6eKma23P166h6s31UzBYPIQNOM2pwFASlG
         MMgrarS5qhSgEFSLwtiwwkpCrGU5xMESRXhZSxvb0icrnAVYngrZk2Sl/XXQLcR2G6bD
         3PE12Kf0NHRmJZlv6jytp+04P8u9/5vdMt2lVuzhH2wklPoFmWvshuufj+HrrpND32ty
         OZhA==
X-Gm-Message-State: AOJu0YyFLEV/fD2J/3Um14SoDwTBoPP5TIIpJdQongmSAkPDdyez0Y17
        IhA5HRONI/oeYQnvp3EmZu0=
X-Google-Smtp-Source: AGHT+IFDGv0IcFGDWjhbcPI+vx3C74smMoDAYO56wRfA06ayqvXVbl2kvjWykZMLhiqfroLWBAg+tg==
X-Received: by 2002:a05:6a00:14d6:b0:6be:4e6e:2a85 with SMTP id w22-20020a056a0014d600b006be4e6e2a85mr11098491pfu.30.1698591825774;
        Sun, 29 Oct 2023 08:03:45 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id fn4-20020a056a002fc400b006b4ac8885b4sm4533150pfb.14.2023.10.29.08.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 08:03:45 -0700 (PDT)
Date:   Sun, 29 Oct 2023 12:03:52 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
        s=2023; t=1698591821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H6ir4IyNIpgPfeg5PpaJZ9z59cp7XPXbuJPLYNgpBPo=;
        b=d8JSTIYYHV2EEGwnhsMk8oG18/GbaBfncaQMdV6VYK5kRB6LjtYzm7mrjWUNYya9BLcKTE
        T5uuvHapRMfm2KXhV5BmI0jMbHVEvpxv/V9zMn+dLkpD92JIE8rPJC+vAdCXR1aT8JUW2i
        U71pqxy853rQZl+6A7nyrJ+aALIshe9tigNdZLISaHfRGRqC+1DlTIoCfL0U7FeZ1V+W6L
        +PY1/oKNJDNUFKbcu7dSEd3S4e1NQejBvghql4RTIy6CW0gooOxZRx3ZvK+8gtkd9ONXOn
        KB8hd2Y5zi+wRzr2x0jkQOypF6a5vABDDDFGOkKUpkfnxa19fobkAl9Beu/lRw==
Authentication-Results: ORIGINATING;
        auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From:   "Ricardo B. Marliere" <ricardo@marliere.net>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Umang Jain <umang.jain@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V2 3/3] staging: vchiq_arm: move state dump to debugfs
Message-ID: <opisoilw6dz4ptneibeesv5gqwnuawybprvguj2v37wm62s4nq@wppomurt3zbz>
References: <20231029124837.119832-1-wahrenst@gmx.net>
 <20231029124837.119832-4-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029124837.119832-4-wahrenst@gmx.net>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested on both aarch64 and armv7l on a RPi 3B using the vchiq_test tool.

/sys/kernel/debug/vchiq/state
/sys/kernel/debug/vchiq/clients/**/trace
/sys/kernel/debug/vchiq/clients/**/use_count
contents are fine.

Tested-by: Ricardo B. Marliere <ricardo@marliere.net>
