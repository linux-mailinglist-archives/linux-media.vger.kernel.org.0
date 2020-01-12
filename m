Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA7C1386D7
	for <lists+linux-media@lfdr.de>; Sun, 12 Jan 2020 15:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733031AbgALOur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jan 2020 09:50:47 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:59775 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733021AbgALOur (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jan 2020 09:50:47 -0500
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Sun, 12 Jan 2020 09:50:45 EST
IronPort-SDR: tfCWYy0g5NFN9wolRn3dPddCMMm969Q1fSW0GpgscD5B8BovKIBJa8jpyuJKmvlZbu9MD4cpNP
 WArB5A13aneg==
IronPort-PHdr: =?us-ascii?q?9a23=3ACnJejhftz4NLbvl4WQYuTu59lGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxcSzZB7h7PlgxGXEQZ/co6odzbaP6Oa6BzxLv8nJmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MRu7oR/PusQXgoZuJac8xx?=
 =?us-ascii?q?nUqXZUZupawn9lK0iOlBjm/Mew+5Bj8yVUu/0/8sNLTLv3caclQ7FGFToqK2?=
 =?us-ascii?q?866tHluhnFVguP+2ATUn4KnRpSAgjK9w/1U5HsuSbnrOV92S2aPcrrTbAoXD?=
 =?us-ascii?q?mp8qlmRAP0hCoBKjU19mbbhNFsg61BpRKgpwVzzpDTYIGPLPp+ebndcskGRW?=
 =?us-ascii?q?VfR8peSSpBDpqgYosTE+oOJ/pXr4njqFsLsxS+AxWsCPrxxT9On3P42qo60+?=
 =?us-ascii?q?I/HgDGxQAvAdQOu2nQoNj7KKseTeW5wa/VxjvBcvxWwy/w5obIfBA7v/+CXq?=
 =?us-ascii?q?9+fsXNxkcgDA7FkledppD5Mz+JyugBrW6W5PdgW+K1jG4nrhl8rCKxyccwlI?=
 =?us-ascii?q?bJnJ8exVDD9SV/z4Y+ONq1SFZlbt64DpRQrS+bN4xwQsMtWGxouD06xaYatp?=
 =?us-ascii?q?KhYCcKz5EnywTfa/yEaoWF5A/oWuWJITpgmn5pZbCyiwyv/UWu1uHwTNe43V?=
 =?us-ascii?q?lQoiZbj9XBtHYA3AHJ5MedUPty5EKh1C6K1wDU9+5LP1g5lbHeK5492r4wkY?=
 =?us-ascii?q?cTsVjbEi/2hkr2iKiWe10h+uey6uTnZq/mqYGYN4NohAzyKLoumsuiDusiPA?=
 =?us-ascii?q?gOWG6b9vqm2LL95k31WLRKjvsonanFqJ3WO9kXq6yjDwNI3Isv9wyzAymp3d?=
 =?us-ascii?q?gCg3ULMVBIdAqCj4fzOlHOJP74De24g1SpiDpr3+7JPqH/DZXXIHnDl7Hhfb?=
 =?us-ascii?q?lm5k5c0wo81sxQ64hIBbEGJfL/QE/xtN/AAh8jLwO02/rnCMl61o4GXWKPA6?=
 =?us-ascii?q?mZML7dsFOR4+IgPfSDZI4PtzvmNfgl6ODhjWUjlV8eY6apx50XZ268Hvh8JE?=
 =?us-ascii?q?WZe3Xs0Z89FjIOvwwjXKnvhVGDWBZNaHuoGaEx/Dc2DMShF4iQfI21hK2923?=
 =?us-ascii?q?KDE4FbfCh5DVaDWSPwaNzbC6tcMwqdJ8ZglnoPUr33GKE70hT7jALmxqAvEe?=
 =?us-ascii?q?3S9WVMrZ//2cJq4OvcvREp/zcyBMOYlWGOGTIn1lgUTiM7ifks6Xd2zU2OhP?=
 =?us-ascii?q?Mg2/E=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HhAgBpMBteXdkYgtlNGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBARgBAYEugU1SIBKNOYdkH4F?=
 =?us-ascii?q?KgXmLY4EAggqBFBWGBxQMgVsNAQEBAQEbGgIBAYRATgEXgTM1CA4CAw0BAQU?=
 =?us-ascii?q?BAQEBAQUEAQECAxoWBYV0QgEBBAcBgU0MHgEEAQEBAQMDAwEBDAGDXQcZDzk?=
 =?us-ascii?q?pIUwBDgEET4VPAQEznUMBhASJAA0NAoUdgkUECoEJgRojgTYBjDKBQT+BIyG?=
 =?us-ascii?q?CKwgBggGCfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxC?=
 =?us-ascii?q?CRQ4BHG2IA4ROgX2jN1d0AYEecTMagiYagSBPGA2WSECBFhACT4RNgUmFJII?=
 =?us-ascii?q?yAQE?=
X-IPAS-Result: =?us-ascii?q?A2HhAgBpMBteXdkYgtlNGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBARgBAYEugU1SIBKNOYdkH4FKgXmLY4EAggqBF?=
 =?us-ascii?q?BWGBxQMgVsNAQEBAQEbGgIBAYRATgEXgTM1CA4CAw0BAQUBAQEBAQUEAQECA?=
 =?us-ascii?q?xoWBYV0QgEBBAcBgU0MHgEEAQEBAQMDAwEBDAGDXQcZDzkpIUwBDgEET4VPA?=
 =?us-ascii?q?QEznUMBhASJAA0NAoUdgkUECoEJgRojgTYBjDKBQT+BIyGCKwgBggGCfwESA?=
 =?us-ascii?q?WyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ4BHG2IA4ROg?=
 =?us-ascii?q?X2jN1d0AYEecTMagiYagSBPGA2WSECBFhACT4RNgUmFJIIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,425,1571695200"; 
   d="scan'208";a="304185882"
Received: from smtp.iservicesmail.com (HELO mailrel03.vodafone.es) ([217.130.24.217])
  by mail01.vodafone.es with ESMTP; 12 Jan 2020 15:45:39 +0100
Received: (qmail 27521 invoked from network); 12 Jan 2020 14:45:35 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel03.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-media@vger.kernel.org>; 12 Jan 2020 14:45:35 -0000
Date:   Sun, 12 Jan 2020 15:45:37 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <pw178483@gmail.com>
To:     linux-media@vger.kernel.org
Message-ID: <11873421.558773.1578840338285.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

