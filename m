Return-Path: <linux-media+bounces-16371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51507954746
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85CFD1F2122D
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 10:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D1619DF4B;
	Fri, 16 Aug 2024 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vns2VbWg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E823C198A32
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805737; cv=none; b=RzGGB08TOCGYtKG1txiVRFJws4IOCM+UEBGaoKmmB0juX6OPuv8YoXdxiaJ6eSyx00Ie/sBJaJVYyJi40rHvL5L30/IXTD9RieZspqGPXcquIomuVVREJtNxE48JryUZdHAEDFMCxRmWZRJ/b85TDhBdYRp4jh6S6EJTNmhQ0c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805737; c=relaxed/simple;
	bh=WPspB0HdaVL1bB3uTcnJSGquWva//jLcVBO1mQxga8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cGkkXT36ZdzHx+X5//S1gcyOrnCrhRFg0aGJrfhlvAuoVsEUS+665GrojbSEYd0VbJfPBHQoJYHe6f7g1TzewII5ZiPMvLoZbVt9bQGYckCfzSWWUTf9yM0rZPxAINg6eTdodsZlU/wDLprUU07jxYQxlgwKI/pp757L6/SYtKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vns2VbWg; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ba482282d3so2337623a12.2
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 03:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723805734; x=1724410534; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihhjjJyL/c8BM1KxHl4L2fv7uS73JJ0zDRCCKxgGx9k=;
        b=vns2VbWgx6/FOKeLVuL0Y+PMTx3VpCU6eTL2S2u4yjDhEhUQU6vD5UP5Vz1fxYCGEv
         5nI/JxAVN4/r+iODNCsDplh6cmj7xo/XGxW5mxj+MioEnDIo336yAWdQ3kEsH3hHnbYw
         VOBTF+DNRphbHQ3YchOkohHxTleoR9z5k0Go+p2elUnv94fqx8qgulagwJt56n+QEXW3
         xR2FD7w72M0cOOM3faHO3iIH/ci+mcbJuZOKSAldcE/+2NXvHXs1E1NtC4rTHQHJHskm
         zdsCu9Ve7052WwP12QSBaV6OXtm19ShE0quMUFKEY4esId6HHjxB9OHEy+X1JPyBhLrP
         ++6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805734; x=1724410534;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihhjjJyL/c8BM1KxHl4L2fv7uS73JJ0zDRCCKxgGx9k=;
        b=E05x5nOhGtfY/5PDdISDa9xPurQ5lmY5UPYohZNIyEql+/ZBwnPLF1+SBL1ogzhcxx
         Iu/KGpVFRnbi04oT6exyvW2vR6s2XRZJEL3njHo5VIKVWy14zPasGESItAjJBPselSVb
         Tr4QsOgPR84nqI/cJauNjPDbN401IZG+fKIqxLPoN+dJx87BXadBZ3fliE6bqKBrSIOB
         cJOuqDJ4KiSR5eyM/iRkmb6adUkRo22C3os9VImpfJAD0S0iwVHiD1NpfLr+90rWsZJj
         CK8zaF6K72uw1vnOcqHrDWJMmeBqw/IqODSgM1KIiuHzCvJBLV3wXOEahfoVCxsRj8qw
         fEuw==
X-Gm-Message-State: AOJu0YxKLl30DV4z4WHBJgFiaRmpfEyPwBqcGjfDn7/8/IYd7MALIy9x
	gpMXayU4c9fR2ubyGGRuxZD9sEXGWLaNKv+NXbvmXJsYjVya9wgHIyluIeuMNQ4=
X-Google-Smtp-Source: AGHT+IFGIv7bHcGPjhTWn3IbqAQMu44lSA4CDd7EfuNO1/ZDzGOxwJ/4SWl69mvv/k/SptPsmciZYQ==
X-Received: by 2002:a05:6402:13d6:b0:5be:cd72:3757 with SMTP id 4fb4d7f45d1cf-5becd7238c7mr1417662a12.20.1723805734098;
        Fri, 16 Aug 2024 03:55:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbbe29c3sm2156808a12.14.2024.08.16.03.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:55:33 -0700 (PDT)
Date: Fri, 16 Aug 2024 13:55:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lin Ma <linma@zju.edu.cn>
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: dvbdev: adopts refcnt to avoid UAF
Message-ID: <e54f9609-18c9-46ff-9d5e-88a49a0d1eb2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Lin Ma,

Commit 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
from Aug 7, 2022 (linux-next), leads to the following Smatch static
checker warning:

	drivers/media/dvb-core/dvbdev.c:601 dvb_remove_device()
	error: double free of 'dvbdev' (line 598)

drivers/media/dvb-core/dvbdev.c
    591 void dvb_remove_device(struct dvb_device *dvbdev)
    592 {
    593         if (!dvbdev)
    594                 return;
    595 
    596         down_write(&minor_rwsem);
    597         dvb_minors[dvbdev->minor] = NULL;
    598         dvb_device_put(dvbdev);
                ^^^^^^^^^^^^^^^^^^^^^^
If this drops the last reference then it frees "dvbdev" so Smatch complains
about use after frees.

    599         up_write(&minor_rwsem);
    600 
--> 601         dvb_media_device_free(dvbdev);
                                      ^^^^^^

    602 
    603         device_destroy(dvb_class, MKDEV(DVB_MAJOR, dvbdev->minor));
                                                           ^^^^^^^^^^^^^

    604 
    605         list_del(&dvbdev->list_head);
                          ^^^^^^
    606 }

regards,
dan carpenter

