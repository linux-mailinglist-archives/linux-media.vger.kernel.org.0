Return-Path: <linux-media+bounces-634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9E7F2280
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 01:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC3CEB217A8
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 00:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9195F17CA;
	Tue, 21 Nov 2023 00:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="oRda8OLG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179FC91
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 16:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1700527832; x=1732063832;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/PssODP5EgrKhulbQ1d5krAiw6qLK9nwNHe3ETP23+E=;
  b=oRda8OLGyTlXgblQL95ac70UQWeopoBDrIzsxhWxOtj7YwOgidFyeryw
   neyon0Vb4zHzZ0//NRJnetVetXaGlsfJ2JGybLlwSgiBmDezAnjSsggaq
   LFIMjKHMezx+E8HmAPfhrmh9SLqyHx/Gf4BHdSd8OnJnWnvUNYR0yxtBx
   Q=;
X-IronPort-AV: E=Sophos;i="6.04,214,1695686400"; 
   d="scan'208";a="254332195"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-1cca8d67.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:50:32 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
	by email-inbound-relay-pdx-2a-m6i4x-1cca8d67.us-west-2.amazon.com (Postfix) with ESMTPS id 811D28034A;
	Tue, 21 Nov 2023 00:50:31 +0000 (UTC)
Received: from EX19MTAUWC002.ant.amazon.com [10.0.7.35:9972]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.48.37:2525] with esmtp (Farcaster)
 id ce8b3783-25f9-4755-86e0-d0e6e79e5c15; Tue, 21 Nov 2023 00:50:31 +0000 (UTC)
X-Farcaster-Flow-ID: ce8b3783-25f9-4755-86e0-d0e6e79e5c15
Received: from EX19D028UWA002.ant.amazon.com (10.13.138.248) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 21 Nov 2023 00:50:30 +0000
Received: from uda95858fd22f53.ant.amazon.com (10.106.239.31) by
 EX19D028UWA002.ant.amazon.com (10.13.138.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 21 Nov 2023 00:50:29 +0000
From: Mengchi Cheng <mengcc@amazon.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <kamatam@amazon.com>, Mengchi Cheng
	<mengcc@amazon.com>
Subject: Inconsistent fence info between 6.1 and 5.15 kernel
Date: Mon, 20 Nov 2023 16:50:14 -0800
Message-ID: <20231121005014.4074003-1-mengcc@amazon.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.239.31]
X-ClientProxiedBy: EX19D038UWB002.ant.amazon.com (10.13.139.185) To
 EX19D028UWA002.ant.amazon.com (10.13.138.248)

Hello,                                                                  
                                                                        
We are upleveling kernel from 5.15.32 to 6.1.62 for our system. The     
kernels we use are all vanila kernel from upstream without any extra    
patches. But we see our graphics application crashed in the 6.1.        
                                                                        
And later we found that 6.1 has DMA_BUF_IOCTL_EXPORT_SYNC_FILE option   
added into dma_buf_ioctl. It initialized dma_fence_stub and returned    
with a sync_file. So then our app called sync_file_ioctl_fence_info to  
inquire fence info, it returns info of dma_fence_stub, which was not    
expected. As the result, the app aborted because of it.                 
                                                                        
Meanwhile, with the 5.15 kernel, our app somehow also called            
DMA_BUF_IOCTL_EXPORT_SYNC_FILE. Since it returned -ENOTTY, the app did  
not further ask for fence info.                                         
                                                                        
I am not a graphics engineer. I do not know if userspace is handling    
dma_fence_stub correctly. But since the addition of                     
DMA_BUF_IOCTL_EXPORT_SYNC_FILE is causing differnet behavior, I am      
wondering if there is a way to keep things consistent in the kernel.    
For example, add a macro to provide a choice disabling it? There is
probably a better solution to it. Look forward to your reply.                                                          
                                                                        
                                                                        
Best,                                                                   
Mengchi Cheng

-- 
2.40.1


