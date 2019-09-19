Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5887B7A74
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 15:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389793AbfISN1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 09:27:36 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47066 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389783AbfISN1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 09:27:35 -0400
Received: by mail-wr1-f65.google.com with SMTP id o18so3055706wrv.13
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sUQ0MapueTEkl2RraQH96DId2uC2BHxqOglzNZ05qbU=;
        b=eQEOD9FvAYPETG7uDikJiTIrCK+JTMQ4XJqYRJNdxQvl2huNPM0s3Xu5lh5ZQMBXt3
         A14UnFoNfQ8gMFBSPOnmLVeqroFtZJ2A1bMq4oabBXWaOEDIo0X4arCiDoS4fotKavIG
         kcZiOVU/fGrSyKLHGCRnw/0qGWhaJzfW81k8iy7462MLZ31K0U61pIP6upLXII62wE2X
         SKlvsX40nCbVtx0YT70u9RocTVUjYOIie3FsKZoHQ/8G4XgyjVr0iAhlf4lXXVJ1oUxw
         Vq9MCtJXxYwvL/RWRXr6P9APFX7fytx64D3VwXSxOJ1VkdnY9gvFE087ULNjo+O3adlh
         qq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sUQ0MapueTEkl2RraQH96DId2uC2BHxqOglzNZ05qbU=;
        b=WU2lSIVVzAJsPXik4Sn/JEXvIrhztIJwsO9331P+jEkd+aoHRw6koWv6LUxBRHBgVo
         NHX/qQdN53exu8MvzGB38DQYaPIc8/CS8IYtL0OwQO5GV97CKHuQNDbWCaBlkyzZlVTx
         5ZgE/FnnKrfCH5wFoGybNmrq9XFgYelp3MhlGwHPFQarz2aRnJLvTL6gmDx4IhVHkI8Y
         ihW5kcJKvSdg0vL6JN1XpMecOKjyAQJC+Ow/fTuJzATNq6sbhyxBYaartRmAAx7HDLaA
         WpKKh6u4S1VrO81SvSfXBSyo/k4yWSimcd35S8k/h4fo0PWXMunZ1Lifq02e7+xPxvcZ
         pY8Q==
X-Gm-Message-State: APjAAAUJdP5ZY0qJjOm8mlJvlcW1F2zH6Y1YtfIZYiZVOJlKCIg7GAgR
        O0CKCx6D7AHMO5zEvn+1NV9uSXdUIJg=
X-Google-Smtp-Source: APXvYqxcm6VB6ZRDFZ5yhB1g+X4C+H5gZbMLz2LF4ER2FkFHrLd6ckERakwuooajt3vWiSOZ9lndYA==
X-Received: by 2002:adf:e607:: with SMTP id p7mr7689694wrm.230.1568899653535;
        Thu, 19 Sep 2019 06:27:33 -0700 (PDT)
Received: from pretoriano-kubuntu.fritz.box ([79.114.202.215])
        by smtp.googlemail.com with ESMTPSA id q10sm18002205wrd.39.2019.09.19.06.27.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 06:27:33 -0700 (PDT)
From:   Flavius Georgescu <pretoriano.mp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: rc: Add support for another 0xffdc device
Date:   Thu, 19 Sep 2019 16:27:09 +0300
Message-Id: <20190919132709.5062-1-pretoriano.mp@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919091445.5038-1-pretoriano.mp@gmail.com>
References: <20190919091445.5038-1-pretoriano.mp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 Please igonore this patch,due to some dumb mistakes and to avoid confusion ,
 i will re-send the patch as a new thread.I apologize for any inconvenience!

