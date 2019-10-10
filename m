Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 812CFD26AC
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 11:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387686AbfJJJve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 05:51:34 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53042 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387400AbfJJJve (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 05:51:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id r19so6217906wmh.2;
        Thu, 10 Oct 2019 02:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aHFN65Csd/xrxQzu8FB0q4K51jhLg6Nw1K88IWkE/Xo=;
        b=Vg1mOyAkeg4XrF3AGBRhpEcGntwVblb3HyOAvq0hjvwCPZ1Xa0rG0puc+kpoEU5rTg
         y/lSBvgglRKSzaysmBb+0FAG/RmeWsxwo6xU6V+LqYr2dbddIrUnqaQAG0OL2lEVaQ/t
         8aobsqUU8Ef/q06+jjhTAWA781m+rYXvePdOXDL62NoADES6NIqFWfW5Q2cJe3EIOWwt
         L9bcJwUE92+XcyLohC2yrfsGIXl7/uo0MzapJHTaqxEBlnUfTzkxwuGsZpSTFYOF4l6I
         RA9npQ1GTgYaO0vOowrsJ1i2vDtY+4V6A7HepnfqQof41+dxqFxrLB+ngO3i6cfpbwib
         mMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aHFN65Csd/xrxQzu8FB0q4K51jhLg6Nw1K88IWkE/Xo=;
        b=dYMIvFwHPuKR/3cQ6zGtHKZwA4kSPe6ugqICaHFHsJC+S5RgVgMLH8Y0seOQyyAluw
         qu3/lwo7WKV/VHNGaQGCLto3enj9Ho9anu+q1MRdb2DTT4MXWAewP4ljOebS6vgjPpKk
         T1HhhzpEs8suxO2sQgr9nz4DOm9Jh2eLYN5IZxGLNLYwRMfRXaCc5UmSt/4sW9qdFQ08
         lpw9IDkL45nNbf0a84ogenQd9MFP2gOtLTKLwt5mJnpALnh+RzWmYXB3X5p/tkZD2Jxk
         Wwvojcz6L05ON2BSpvkBHYKCsImCV5lniQfCtO1Ya6txNT1O6usX7bLZ5bJILl+tqedb
         Azyw==
X-Gm-Message-State: APjAAAX0YPHvIkF+LhGJmgqZo2ZBY1BquL8/pu0touE38gCQ8eYunhsX
        dFcCy7RAd7WgjkAA+RKAANw=
X-Google-Smtp-Source: APXvYqyPbJZpHATNxhAcfYFLJqGU8BIPoxBObKr+SglCL34kv1hRQlx1GqAHDeBTW+y0t+BA4JtWtw==
X-Received: by 2002:a1c:e455:: with SMTP id b82mr6835014wmh.41.1570701091565;
        Thu, 10 Oct 2019 02:51:31 -0700 (PDT)
Received: from localhost.localdomain ([46.114.37.24])
        by smtp.googlemail.com with ESMTPSA id o4sm11678251wre.91.2019.10.10.02.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 02:51:30 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     linux-media@vger.kernel.org, mchehab@infradead.org, jp@jpvw.nl,
        crope@iki.fi, sean@mess.org, linux-kernel@vger.kernel.org,
        Gon Solo <gonsolo@gmail.com>,
        Andreas Wendleder <andreas.wendleder@gmail.com>
Subject: [PATCH 0/4] Add support for Logilink VG0022A.
Date:   Thu, 10 Oct 2019 11:50:59 +0200
Message-Id: <20191010095103.3803-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010091848.GA2898@Limone>
References: <20191010091848.GA2898@Limone>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches add support for the Logilink VG0022A.

Signed-off-by: Andreas Wendleder <andreas.wendleder@gmail.com>

Gon Solo (4):
  si2168: Use bits and convert to kernel-doc format.
  si2157: Add option for not downloading firmware.
  af9035: Make speed computation clear.
  Add support for Logilink VG0022A.

 drivers/media/dvb-frontends/si2168.h      | 47 +++++++++++++----------
 drivers/media/dvb-frontends/si2168_priv.h | 10 ++---
 drivers/media/tuners/si2157.c             |  6 +++
 drivers/media/tuners/si2157.h             | 33 +++++++++-------
 drivers/media/tuners/si2157_priv.h        |  5 ++-
 drivers/media/usb/dvb-usb-v2/af9035.c     | 37 ++++++++++++++++--
 6 files changed, 92 insertions(+), 46 deletions(-)

-- 
2.20.1

